require 'minitest/autorun'
require 'open-uri'
require './day-2-1.rb'
require './day-2-2.rb'

class TestAdventOfCodeDay2 < Minitest::Test
  def setup
    @input_file = "./input/day-2-input.txt"
    @input = File.open(@input_file)
  end

  def test_part_1
    assert_equal 1598415, total_wrapping_paper(@input)
  end

  def test_part_2
    assert_equal 3812909, total_ribbon(@input)
  end
end
