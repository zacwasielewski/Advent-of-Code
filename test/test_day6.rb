require 'minitest/autorun'
require './day6.rb'

class TestDay6 < Minitest::Test
  def setup
    @input = File.open("./input/input_day6.txt").read
  end

  def test_part_1
    assert_equal 400410, Day6.solve_part_1(@input)
  end

  def test_part_2
    assert_equal 15343601, Day6.solve_part_2(@input)
  end
end

class TestLights < Minitest::Test
  def setup
    @lights = Lights.new
  end

  def test_sequence
    assert_equal 0, @lights.on_count
    assert_equal 1_000_000, @lights.change('turn on 0,0 through 999,999').on_count
    assert_equal 999000, @lights.change('toggle 0,0 through 999,0').on_count
    assert_equal 998996, @lights.change('turn off 499,499 through 500,500').on_count
  end

end

class TestDimmableLights < Minitest::Test
  def setup
    @lights = DimmableLights.new
  end

  def test_sequence
    assert_equal 0, @lights.total_brightness
    assert_equal 1, @lights.change('turn on 0,0 through 0,0').total_brightness
    assert_equal 2000001, @lights.change('toggle 0,0 through 999,999').total_brightness
  end

end
