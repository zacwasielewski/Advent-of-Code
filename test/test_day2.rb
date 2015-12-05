require 'minitest/autorun'
require 'open-uri'
require './day2.rb'

class TestDay2 < Minitest::Test
  def setup
    input_file = "./input/input_day2.txt"
    @input = File.open(input_file).read
  end

  def test_part_1
    assert_equal 58, Day2.new('2x3x4').total_square_feet_of_wrapping_paper
    assert_equal 43, Day2.new('1x1x10').total_square_feet_of_wrapping_paper
    assert_equal 1598415, Day2.new(@input).total_square_feet_of_wrapping_paper
  end

  def test_part_2
    assert_equal 3812909, Day2.new(@input).total_ribbon
  end
end
