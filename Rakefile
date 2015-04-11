# encoding: utf-8
require 'bundler'
Bundler::GemHelper.install_tasks

begin
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new(:spec)

  task :default => :spec
rescue LoadError
  # no rspec available
  # end
end
