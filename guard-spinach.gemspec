# -*- encoding: utf-8 -*-
require File.expand_path('../lib/guard/spinach/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Josep Jaume"]
  gem.email         = ["josepjaume@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ''

  gem.add_runtime_dependency 'guard'
  gem.add_development_dependency 'mocha'
  gem.add_development_dependency 'minitest'

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "guard-spinach"
  gem.require_paths = ['lib']
  gem.version       = Guard::SPINACH_VERSION
end
