require 'minitest/autorun'
require 'open-uri'
require './day-3.rb'

class TestAdventOfCodeDay3 < Minitest::Test
  def setup
    @input_file = "./input/day-3-input.txt"
    @input = File.open(@input_file).read
  end

  def test_part_1
    assert_equal 2, unique_houses_visited_by_santa('>')
    assert_equal 4, unique_houses_visited_by_santa('^>v<')
    assert_equal 2, unique_houses_visited_by_santa('^v^v^v^v^v')
    assert_equal 2081, unique_houses_visited_by_santa(@input)
  end

  def test_part_2
    assert_equal 3, unique_houses_visited_by_santa_and_robosanta('^v')
    assert_equal 3, unique_houses_visited_by_santa_and_robosanta('^>v<')
    assert_equal 11, unique_houses_visited_by_santa_and_robosanta('^v^v^v^v^v')
    assert_equal 2341, unique_houses_visited_by_santa_and_robosanta(@input)
  end
end
