require 'minitest/autorun'
require './day9.rb'

class TestDay9 < Minitest::Test
  def setup
    @input = File.open("./input/input_day9.txt").read
  end

  def test_sample_data
    tsp = TravelingSalesman.new
    File.open("./input/input_day9_sample.txt").read.strip.split("\n").each{|line|
      tsp.add_distance( *tsp.parse_line(line) )
    }
    assert_equal 605, tsp.shortest_route
    assert_equal 982, tsp.longest_route
  end

  def test_part_1
    assert_equal 251, Day9.solve_part_1(@input)
  end

  def test_part_2
    assert_equal 898, Day9.solve_part_2(@input)
  end
end
