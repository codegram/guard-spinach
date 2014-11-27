require 'guard'
require 'guard/plugin'

module Guard
  class Spinach < Plugin
    def start
      run_all if @options[:all_on_start]
    end

    def run_all
      Runner.new([], @options).run
    end

    def run_on_change(paths)
      Runner.new(paths, @options).run
    end
  end
end

require_relative "spinach/runner"
require_relative "spinach/version"
