module Guard
  class Spinach
    class Runner
      attr_reader :paths

      def initialize(paths, opts=nil)
        @paths = paths
        if opts
          @generate = true if opts[:generate]
          @command_prefix = opts[:command_prefix] if opts[:command_prefix]
        end
      end

      def run
        puts "Running #{paths.empty? ? "all Spinach features" : paths.join(" ")}"
        system(run_command)
        notify($? == 0)
      end

      def run_command
        "#{@command_prefix} spinach #{paths.join(" ")}#{' -g' if @generate}"
      end

      def notify(passed)
        opts = {title: 'Spinach results', priority: 2}

        if passed
          status = 'Passed'
          image = :success
        else
          status = 'Failed'
          image = :failed
        end

        Notifier.notify(status, opts.merge(image: image))
      end
    end
  end
end
