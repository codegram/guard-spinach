require 'bundler/setup'
Bundler.require :default, :test

require 'minitest/spec'
require 'minitest/autorun'
require 'mocha/setup'

require_relative '../lib/guard/spinach'

def capture_output
  output = StringIO.new
  $stdout = output
  $stderr = output
  yield
  return output.string
ensure
  $stdout = STDOUT
  $stdout = STDERR
end
