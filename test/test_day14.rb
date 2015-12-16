require 'minitest/autorun'
require 'json'
require './day14.rb'

class TestDay14 < Minitest::Test
  def setup
    @input = File.open("./input/input_day14.txt")
  end

  def test_sample
    input = File.open("./input/input_day14_sample.txt")
    solution = input.readlines.map {|str|
      name, flight_speed, flight_time, rest_time = ReindeerTravel.parse_rule(str)
      Reindeer.new(name, flight_speed, flight_time, rest_time).distance_after(1000)
    }.max
    assert_equal 1120, solution
  end

  def test_part_1
    #assert_equal 2640, Day14.solve_part_1(@input, 2503)
  end

  def test_part_2
    #assert_equal 668, Day13.solve_part_2(@input)
  end
end
