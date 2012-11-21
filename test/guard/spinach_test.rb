require_relative '../test_helper'

describe Guard::Spinach do
  subject do
    Guard::Spinach.new
  end
  let(:paths) do
    ['fake/path.feature', 'foo/bar.feature']
  end
  describe "#run_on_changes" do
    it "fires run on a runner" do
      Guard::Spinach::Runner.any_instance.expects(:system).with(
        "spinach fake/path.feature foo/bar.feature")
      subject.run_on_changes(paths)
    end
  end
end
