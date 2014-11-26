require_relative '../test_helper'

describe Guard::Spinach do
  subject do
    Guard::Spinach.new(options)
  end
  let(:paths) do
    ['fake/path.feature', 'foo/bar.feature']
  end
  let(:options) do
    {}
  end
  describe "#run_on_change" do
    it "fires run on a runner" do
      Guard::Spinach::Runner.any_instance.expects(:system).with(
        "spinach fake/path.feature foo/bar.feature")
      subject.run_on_change(['fake/path.feature', 'foo/bar.feature'])
    end
    describe "with generate enabled" do
      let(:options) do
        { :generate => true }
      end
      it "runs with step definition file generation enabled" do
        Guard::Spinach::Runner.any_instance.expects(:system).with(
          "spinach #{paths.join(' ')} -g")
        subject.run_on_change(paths)
      end
    end
  end
  describe "#run_all" do
    it "fires run on a runner" do
      Guard::Spinach::Runner.any_instance.expects(:system).with(
        "spinach ")
      subject.run_all
    end
    describe "with generate enabled" do
      let(:options) do
        { :generate => true }
      end
      it "runs with step definition file generation enabled" do
        Guard::Spinach::Runner.any_instance.expects(:system).with(
          "spinach  -g")
        subject.run_all
      end
    end
  end
  describe "#start" do
    describe "with defaults" do
      it "does not fire run on a runner" do
        Guard::Spinach::Runner.any_instance.expects(:system).never
        subject.start
      end
    end
    describe "with all_on_start => true" do
      let(:options) do
        { :all_on_start => true }
      end
      it "fires run on a runner" do
        Guard::Spinach::Runner.any_instance.expects(:system).with(
          "spinach ")
        subject.start
      end
    end
    describe "with generate and all_on_start" do
      let(:options) do
        { :generate => true, :all_on_start => true }
      end
      it "runs with step definition file generation enabled" do
        Guard::Spinach::Runner.any_instance.expects(:system).with(
          "spinach  -g")
        subject.start
      end
    end
  end
end
