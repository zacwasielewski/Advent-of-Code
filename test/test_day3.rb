require 'minitest/autorun'
require 'open-uri'
require './day3.rb'

class TestDay3 < Minitest::Test
  def setup
    @input = File.open("./input/input_day3.txt").read
  end

  def test_part_1
    assert_equal 2, Day3.new('>').unique_houses_visited_by_santa
    assert_equal 4, Day3.new('^>v<').unique_houses_visited_by_santa
    assert_equal 2, Day3.new('^v^v^v^v^v').unique_houses_visited_by_santa
    assert_equal 2081, Day3.new(@input).unique_houses_visited_by_santa
  end

  def test_part_2
    assert_equal 3, Day3.new('^v').unique_houses_visited_by_santa_and_robosanta
    assert_equal 3, Day3.new('^>v<').unique_houses_visited_by_santa_and_robosanta
    assert_equal 11, Day3.new('^v^v^v^v^v').unique_houses_visited_by_santa_and_robosanta
    assert_equal 2341, Day3.new(@input).unique_houses_visited_by_santa_and_robosanta
  end
end
