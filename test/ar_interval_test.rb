require "test_helper"

class ArIntervalTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::ArInterval::VERSION
  end

  def test_it_does_something_useful
    assert Occurence.count == 0
  end
end
