require 'minitest/autorun'
require './day6.rb'

class TestDay6 < Minitest::Test
  def setup
    @input = File.open("./input/input_day6.txt").read
  end

  def test_part_1
    assert_equal _, Day6.solve_part_1(@input)
  end

  def test_part_2
    #assert_equal 51, Day6.solve_part_2(@input)
  end
end
