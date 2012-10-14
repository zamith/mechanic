module Mechanic
  class EngineBuilder < Rails::PluginBuilder
    include Mechanic::Actions

    def readme
      template 'README.md.erb', 'README.md'
    end

    def raise_delivery_errors
      replace_in_file "#{dummy_path}/config/environments/development.rb",
        'raise_delivery_errors = false', 'raise_delivery_errors = true'
    end

    def add_custom_gems
      additions_path = find_in_source_paths 'gemspec_additions'
      new_gems = File.open(additions_path).read
      inject_into_file "#{name}.gemspec", "\n#{new_gems}",
        :after => /s.add_dependency "rails", "~> 3.2.8"/
    end

    def add_capybara_webkit_gem
      inject_into_file "#{name}.gemspec", "  s.add_development_dependency 'capybara-webkit'\n",
        :before => /^end$/
    end

    def use_postgres_config_template
      template 'postgresql_database.yml.erb', "#{dummy_path}/config/database.yml",
        :force => true
    end

    def create_database
      inside dummy_path do
        bundle_command 'exec rake db:create'
      end
    end

    def configure_action_mailer
      inside dummy_path do
        action_mailer_host 'development', "#{name}.local"
        action_mailer_host 'test', 'www.example.com'
        action_mailer_host 'production', "#{name}.com"
      end
    end

    def generate_rspec
      inside dummy_path do
        bundle_command 'exec rails g rspec:install'
        inject_into_file '.rspec', " --drb", :after => '--color'
        append_file "spec/spec_helper.rb", "\n  load '\#{Rails.root}/db/seeds.rb'"
      end
    end

    def configure_time_zone
      time_zone_config = <<-RUBY
          config.active_record.default_timezone = :utc
      RUBY
      inject_into_class "#{dummy_path}/config/application.rb", "Application", time_zone_config
    end

    def configure_capybara_webkit
      append_file "#{dummy_path}/spec/spec_helper.rb", "\n  Capybara.javascript_driver = :webkit\n"
    end

    def add_email_validator
      if mountable?
        copy_file 'email_validator.rb', "app/#{name}/validators/email_validator.rb"
      else
        copy_file 'email_validator.rb', 'app/validators/email_validator.rb'
      end
    end

    def setup_default_rake_task
      append_file 'Rakefile', "task(:default).clear\ntask :default => [:spec]"
    end

    def gitignore_files
      concat_file 'mechanic_gitignore', '.gitignore'
    end

    def init_git
      run 'git init'
    end

    def create_github_repo(repo_name)
      path_addition = override_path_for_tests
      run "#{path_addition} hub create #{repo_name}"
    end

    private

    def override_path_for_tests
      if ENV['TESTING']
        support_bin = File.expand_path(File.join('..', '..', '..', 'features', 'support', 'bin'))
        "PATH=#{support_bin}:$PATH"
      end
    end
  end
end