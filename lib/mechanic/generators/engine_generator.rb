require 'rails/generators'
require 'rails/generators/rails/plugin_new/plugin_new_generator'

module Mechanic
  class EngineGenerator < Rails::Generators::PluginNewGenerator

    class_option :database, :type => :string, :aliases => '-d', :default => "sqlite3",
      :desc => "Preconfigure for selected database (options: #{DATABASES.join('/')})"

    class_option :github, :type => :string, :aliases => '-G', :default => nil,
      :desc => 'Create Github repository and add remote origin pointed to repo'

    class_option :webkit, :type => :boolean, :aliases => '-W', :default => true,
      :desc => 'Add the Capybara Webkit Javascript integration testing library'

    class_option :skip_test_unit, :type => :boolean, :aliases => '-T', :default => true,
      :desc => 'Skip Test::Unit files'

    class_option :dummy_path, :type => :string, :default => "spec/dummy",
      :desc => "Create dummy application at given path"

    def finish_template
      invoke :call_the_mechanic
      super
    end

    def call_the_mechanic
      invoke :setup_development_environment
      invoke :customize_gemspec
      invoke :setup_test_database
      invoke :configure_engine
      invoke :setup_git
      invoke :create_github_repo
      invoke :wrap_up
    end

    def setup_development_environment
      say 'Setting up the development environment'
      build :raise_delivery_errors
    end

    def customize_gemspec
      build :add_custom_gems

      if options[:webkit]
        build :add_capybara_webkit_gem
      end

      #bundle_command 'install'
    end

    def setup_test_database
      say 'Setting up database in spec/dummy'

      if 'postgresql' == options[:database]
        build :use_postgres_config_template
      end

      build :create_database
    end

    def configure_engine
      say 'Configuring engine'
      build :configure_action_mailer
      build :generate_rspec
      build :configure_time_zone

      if options[:webkit]
        build :configure_capybara_webkit
      end

      build :add_email_validator
      build :setup_default_rake_task
    end

    def setup_git
      say 'Initializing git'
      invoke :setup_gitignore
      invoke :init_git
    end

    def create_github_repo
      if options[:github]
        say 'Creating Github repo'
        build :create_github_repo, options[:github]
      end
    end

    def wrap_up
      say 'Congratulations! Your trip to shop was a success.'
    end

    def setup_gitignore
      build :gitignore_files
    end

    def init_git
      build :init_git
    end

    def run_bundle
      # Let's not: We'll bundle manually at the right spot
    end

    private

    def get_builder_class
      Mechanic::EngineBuilder
    end

    def using_active_record?
      !options[:skip_active_record]
    end
  end
end