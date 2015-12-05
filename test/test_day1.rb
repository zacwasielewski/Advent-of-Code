require 'minitest/autorun'
require 'open-uri'
require './day1.rb'

class TestDay1 < Minitest::Test
  def setup
    input_file = "./input/input_day1.txt"
    @input = File.open(input_file).read.strip
  end

  def test_part_1
    assert_equal 0, Day1.santas_destination_floor('(())')
    assert_equal 0, Day1.santas_destination_floor('()()')
    assert_equal 3, Day1.santas_destination_floor('(((')
    assert_equal 3, Day1.santas_destination_floor('(()(()(')
    assert_equal 3, Day1.santas_destination_floor('))(((((')
    assert_equal -1, Day1.santas_destination_floor('())')
    assert_equal -1, Day1.santas_destination_floor('))(')
    assert_equal -3, Day1.santas_destination_floor(')))')
    assert_equal -3, Day1.santas_destination_floor(')())())')
    assert_equal 74, Day1.santas_destination_floor(@input)
  end

  def test_part_2
    assert_equal 1, Day1.santas_first_descent_to_basement(')')
    assert_equal 5, Day1.santas_first_descent_to_basement('()())')
    assert_equal 1795, Day1.santas_first_descent_to_basement(@input)
  end
end
