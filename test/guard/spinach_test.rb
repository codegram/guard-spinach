require_relative '../test_helper'

describe Guard::Spinach do
  subject do
    Guard::Spinach.new(data)
  end
  let(:paths) do
    ['fake/path.feature', 'foo/bar.feature']
  end
  describe "#run_on_change" do
    it "fires run on a runner" do
      Guard::Spinach::Runner.any_instance.expects(:system).with(
        "spinach fake/path.feature foo/bar.feature")
    end
  end
end
