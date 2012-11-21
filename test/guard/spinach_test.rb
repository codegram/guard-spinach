require_relative '../test_helper'

describe Guard::Spinach do
  let(:spinach) { Guard::Spinach.new }
  let(:paths) { ['fake/path.feature', 'foo/bar.feature'] }

  describe '#run_on_changes' do
    it 'fires run on a runner' do
      Guard::Spinach::Runner.any_instance.expects(:system).with(
        'spinach fake/path.feature foo/bar.feature')
      spinach.run_on_changes(paths)
    end
  end
end
