require 'minitest/autorun'
require 'open-uri'
require './day2.rb'
require './day2_2.rb'

class TestDay2 < Minitest::Test
  def setup
    @input_file = "./input/input_day2.txt"
    @input = File.open(@input_file)
  end

  def test_part_1
    assert_equal 1598415, total_wrapping_paper(@input)
  end

  def test_part_2
    assert_equal 3812909, total_ribbon(@input)
  end
end
