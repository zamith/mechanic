$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "cenas/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "cenas"
  s.version     = Cenas::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Cenas."
  s.description = "TODO: Description of Cenas."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.8"
  s.add_dependency "sass-rails"
  s.add_dependency "formtastic"

  s.add_development_dependency "thin"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "email_spec"
  s.add_development_dependency "capybara"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "launchy"
  s.add_development_dependency "jasmine-rails"
  s.add_development_dependency "jasmine-jquery-rails"
  s.add_development_dependency "shoulda-matchers"
  s.add_development_dependency "timecop"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'capybara-webkit'
end
