module Guard
  class Spinach
    class Runner
      attr_reader :paths, :options

      def initialize(paths, opts = nil)
        @paths = paths
        @options = opts || {}
      end

      def run
        puts "Running #{paths.empty? ? "all Spinach features" : paths.join(" ")}"
        system(run_command)
        notify($? == 0)
      end

      def run_command
        cmd = []
        cmd << @options[:command_prefix] if @options[:command_prefix]
        cmd << 'spinach'
        cmd << paths.join(" ")
        cmd << '-g' if @options[:generate]
        cmd.join(" ")
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
