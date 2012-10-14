# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mechanic/version'

Gem::Specification.new do |gem|
  gem.name          = "mechanic"
  gem.version       = Mechanic::VERSION
  gem.authors       = ["Zamith"]
  gem.email         = ["zamith.28@gmail.com"]
  gem.description   = %q{Makes your engines better.}
  gem.summary       = %q{Mechanic creates engines the Group Buddies way.}
  gem.homepage      = "https://github.com/zamith/mechanic"

  gem.files         = `git ls-files`.split($/).
    reject { |file| file =~ /^\./ }.
    reject { |file| file =~ /^(rdoc|pkg)/ }
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.require_paths = ["lib"]

  gem.rdoc_options = ["--charset=UTF-8"]
  gem.extra_rdoc_files = %w[README.md]

  gem.add_dependency 'rails', '3.2.8'
  gem.add_dependency 'bundler', '>= 1.1'
  gem.add_dependency 'hub', '~> 1.10.2'

  gem.add_development_dependency 'cucumber', '~> 1.1.9'
  gem.add_development_dependency 'aruba', '~> 0.4.11'
end
