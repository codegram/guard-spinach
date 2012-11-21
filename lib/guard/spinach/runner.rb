module Guard
  class Spinach
    class Runner
      attr_reader :paths

      def initialize(paths)
        @paths = paths
      end

      def run
        puts "Running #{paths.join(" ")}\n"
        system(run_command)
        notify($? == 0)
      end

      def run_command
        "spinach #{paths.join(" ")}"
      end

      def notify(passed)
        opts = { :title => "Spinach results", :priority => 2 }

        if passed
          Notifier.notify("Passed", opts.merge(:image => :success))
        else
          Notifier.notify("Failed", opts.merge(:image => :failed))
        end
      end
    end
  end
end
