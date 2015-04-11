require_relative '../../spec_helper'

describe Guard::Spinach::Runner do
  let(:runner) { Guard::Spinach::Runner.new(paths, options) }
  let(:paths) { ['fake/path.feature', 'foo/bar.feature'] }
  let(:options) { nil }

  describe '#initialize' do
    it 'sets up a bunch of file paths' do
      expect(runner.paths).to include 'fake/path.feature'
      expect(runner.paths).to include 'foo/bar.feature'
    end
  end

  describe '#run_command' do
    it 'generates a valid run command' do
      expect(runner.run_command).to eq 'spinach fake/path.feature foo/bar.feature'
    end

    describe 'when :command_prefix option is given' do
      let(:options) { { :command_prefix => 'zeus' } }

      it 'generates a run command with prefix' do
        expect(runner.run_command).to eq 'zeus spinach fake/path.feature foo/bar.feature'
      end
    end

    describe 'when :generate option is given' do
      let(:options) { { :generate => true } }

      it 'generates a run command with -g flag' do
        expect(runner.run_command).to eq 'spinach fake/path.feature foo/bar.feature -g'
      end
    end
  end

  describe '#run' do
    it 'runs spinach on all the features in the list' do
      expect(runner).to receive(:system).with('spinach fake/path.feature foo/bar.feature')

      capture_output{ runner.run }
    end

    it 'outputs a message' do
      expect(runner).to receive(:system)

      output = capture_output{ runner.run }

      expect(output).to include 'Running'
      expect(output).to include paths[0]
      expect(output).to include paths[1]
    end

    it 'notifies of success' do
      allow(runner).to receive(:system).and_return(`(exit 0)`)
      expect(Guard::Notifier).to receive(:notify).with('Passed', title: 'Spinach results', image: :success, priority: 2)

      runner.run
    end

    it 'notifier of failures' do
      allow(runner).to receive(:system).and_return(`(exit 1)`)
      expect(Guard::Notifier).to receive(:notify).with('Failed', title: 'Spinach results', image: :failed, priority: 2)

      runner.run
    end
  end
end
