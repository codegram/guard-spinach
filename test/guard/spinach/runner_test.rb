require_relative '../../test_helper'

describe Guard::Spinach::Runner do
  subject do
    Guard::Spinach::Runner.new(paths)
  end
  let(:paths) do
    ['fake/path.feature', 'foo/bar.feature']
  end
  describe "#initialize" do
    it "sets up a bunch of file paths" do
      subject.paths.must_include 'fake/path.feature'
      subject.paths.must_include 'foo/bar.feature'
    end
  end
  describe "#run_command" do
    it "generates a valid run command" do
      subject.run_command.must_equal "spinach fake/path.feature foo/bar.feature"
    end
  end
  describe "#run" do
    it "runs spinach on all the features in the list" do
      subject.expects(:system).with("spinach fake/path.feature foo/bar.feature")
      capture_output{ subject.run }
    end
    it "outputs a message" do
      subject.stubs(:system)
      output = capture_output{ subject.run }
      output.must_include "Running"
      output.must_include paths[0]
      output.must_include paths[1]
    end
    it "notifies of success" do
      subject.stubs(:system).returns(`(exit 0)`)
      Guard::Notifier.expects(:notify).with("Passed", :title => "Spinach results", :image => :success, :priority => 2)
      subject.run
    end
    it "notifier of failures" do
      subject.stubs(:system).returns(`(exit 1)`)
      Guard::Notifier.expects(:notify).with("Failed", :title => "Spinach results", :image => :failed, :priority => 2)
      subject.run
    end
  end
end
