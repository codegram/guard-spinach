require_relative '../../test_helper'

describe Guard::Spinach::Runner do
  let(:runner) { Guard::Spinach::Runner.new(paths) }
  let(:paths) { ['fake/path.feature', 'foo/bar.feature'] }

  describe '#initialize' do
    it 'sets up a bunch of file paths' do
      runner.paths.must_include 'fake/path.feature'
      runner.paths.must_include 'foo/bar.feature'
    end
  end

  describe '#run_command' do
    it 'generates a valid run command' do
      runner.run_command.must_equal 'spinach fake/path.feature foo/bar.feature'
    end
  end

  describe '#run' do
    it 'runs spinach on all the features in the list' do
      runner.expects(:system).with('spinach fake/path.feature foo/bar.feature')
      capture_output{ runner.run }
    end

    it 'outputs a message' do
      runner.stubs(:system)
      output = capture_output{ runner.run }
      output.must_include 'Running'
      output.must_include paths[0]
      output.must_include paths[1]
    end

    it 'notifies of success' do
      runner.stubs(:system).returns(`(exit 0)`)
      Guard::Notifier.expects(:notify).with('Passed', title: 'Spinach results', image: :success, priority: 2)
      runner.run
    end

    it 'notifier of failures' do
      runner.stubs(:system).returns(`(exit 1)`)
      Guard::Notifier.expects(:notify).with('Failed', title: 'Spinach results', image: :failed, priority: 2)
      runner.run
    end
  end
end
