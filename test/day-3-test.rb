require 'minitest/autorun'
require 'open-uri'
require './day-3-1.rb'
#require './day-2-2.rb'

class TestAdventOfCodeDay3 < Minitest::Test
  def setup
    @input_file = "./input/day-3-input.txt"
    @input = File.open(@input_file)
  end

  def test_part_1
    assert_equal 2, number_of_houses_delivered_presents('>')
    assert_equal 4, number_of_houses_delivered_presents('^>v<')
    assert_equal 2, number_of_houses_delivered_presents('^v^v^v^v^v')
    assert_equal 2081, number_of_houses_delivered_presents(@input)
  end

  #def test_part_2
  #  assert_equal 3812909, total_ribbon(@input)
  #end
end
