require 'guard'
require 'guard/guard'

module Guard
  class Spinach < Guard
    def run_on_change(paths)
      Runner.new(paths).run
    end
  end
end

require_relative "spinach/runner"
require_relative "spinach/version"
