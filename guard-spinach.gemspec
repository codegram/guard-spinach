# -*- encoding: utf-8 -*-
require File.expand_path('../lib/guard/spinach/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Josep Jaume"]
  gem.email         = ["josepjaume@gmail.com"]
  gem.description   = %q{guard-spinach is a guard plugin for spinach}
  gem.summary       = %q{guard-spinach is a guard plugin for spinach}
  gem.homepage      = 'http://github.com/codegram/guard-spinach'

  gem.add_runtime_dependency 'guard', '~> 2.0'
  gem.add_runtime_dependency 'spinach'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "guard-spinach"
  gem.require_paths = ['lib']
  gem.version       = Guard::SPINACH_VERSION
end
