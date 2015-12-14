require 'minitest/autorun'
require './day10.rb'

class TestDay10 < Minitest::Test
  def setup
    @input = "1113122113"
  end

  def test_sample_data
    assert_equal "11", Day10.look_and_say("1")
    assert_equal "21", Day10.look_and_say("11")
    assert_equal "1211", Day10.look_and_say("21")
    assert_equal "111221", Day10.look_and_say("1211")
    assert_equal "312211", Day10.look_and_say("111221")
  end

  def test_part_1
    assert_equal 360154, Day10.solve_part_1(@input)
  end

  def test_part_2
    assert_equal 5103798, Day10.solve_part_2(@input)
  end
end
