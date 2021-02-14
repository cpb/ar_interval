require "test_helper"

describe ArInterval do
  it "has a version number" do
    refute_nil ::ArInterval::VERSION
  end

  before do
    Occurence.destroy_all
  end

  it "has Occurence test model configured" do
    assert Occurence.count == 0
  end

  describe "one occurence" do
    before do
      Occurence.create(
        start_time: DateTime.new(2021,2,12,12,02),
        interval: "P1DT3H18M",
      )
    end

    it { _(Occurence.count) == 1 }
  end

  describe "Occurence.occuring(at)" do
    let(:at) { DateTime.new(2021,2,13,15,30) }
    subject { Occurence.occuring(at) }

    before do
      Occurence.create(
        start_time: DateTime.new(2021,2,12,12,02),
        interval: "P1DT3H18M",
      )
    end

    it { _(subject.count) == 1 }
  end
end
