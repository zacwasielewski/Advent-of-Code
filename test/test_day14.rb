require 'minitest/autorun'
require 'json'
require './day14.rb'

class TestDay14 < Minitest::Test
  def setup
    @input = File.open("./input/input_day14.txt")
  end

  def test_sample
    assert_equal 1120, Day14.solve_part_1(File.open("./input/input_day14_sample.txt"), 1000)
    assert_equal 689,  Day14.solve_part_2(File.open("./input/input_day14_sample.txt"), 1000)
  end

  def test_part_1
    assert_equal 2640, Day14.solve_part_1(@input, 2503)
  end

  def test_part_2
    assert_equal 1102, Day14.solve_part_2(@input, 2503)
  end
end
