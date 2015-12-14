require 'minitest/autorun'
require 'json'
require './day13.rb'

class TestDay13 < Minitest::Test
  def setup
    @input = File.read("./input/input_day13.txt")
    @input_sample = File.read("./input/input_day13_sample.txt")
  end

  def test_sample
    assert_equal 330, Day13.solve_part_1(@input_sample)
  end

  def test_part_1
    assert_equal 709, Day13.solve_part_1(@input)
  end

  def test_part_2
    assert_equal 668, Day13.solve_part_2(@input)
  end
end
