require 'bundler/setup'
Bundler.require :default, :test

require 'rspec'
require_relative '../lib/guard/spinach'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end

  config.order = :random
end

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
