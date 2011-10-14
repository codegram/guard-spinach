require 'bundler/setup'
Bundler.require :default, :test

require 'mocha'
require 'minitest/spec'
require 'minitest/autorun'

require_relative '../lib/guard/spinach'

def capture_stdout
  output = StringIO.new
  $stdout = output
  $stderr = output
  yield
ensure
  $stdout = STDOUT
  $stdout = STDERR
end
