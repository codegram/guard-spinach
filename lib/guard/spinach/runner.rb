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
      end

      def run_command
        "spinach #{paths.join(" ")}"
      end
    end
  end
end
