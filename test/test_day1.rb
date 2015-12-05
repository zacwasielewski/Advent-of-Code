require 'minitest/autorun'
require 'open-uri'
require './day1.rb'
require './day1_2.rb'

class TestDay1 < Minitest::Test
  def setup
    @input_file = "./input/input_day1.txt"
    @input = File.open(@input_file).read.strip
  end

  def test_part_1
    assert_equal 74, get_floor(@input)
  end

  def test_part_2
    assert_equal 1795, first_descent_to_basement(@input)
  end
end
