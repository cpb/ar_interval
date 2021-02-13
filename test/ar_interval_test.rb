require "test_helper"

describe ArInterval do
  it "has a version number" do
    refute_nil ::ArInterval::VERSION
  end

  it "has Occurence test model configured" do
    assert Occurence.count == 0
  end
end
