require 'minitest/autorun'
require 'open-uri'
require './day-1-1.rb'
require './day-1-2.rb'

class TestAdventOfCodeDay1 < Minitest::Test
  def setup
    @input_file = "./input/day-1-input.txt"
    @input = File.open(@input_file).read.strip
  end

  def test_part_1
    assert_equal 74, get_floor(@input)
  end

  def test_part_2
    assert_equal 1795, first_descent_to_basement(@input)
  end
end
