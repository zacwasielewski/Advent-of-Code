require 'minitest/autorun'
require './day5.rb'

class TestDay5 < Minitest::Test
  def setup
    @input = File.open("./input/input_day5.txt").read
  end

  def test_part_1
    assert MoralString.new('ugknbfddgicrmopn').nice?
    assert MoralString.new('aaa').nice?
    assert MoralString.new('jchzalrnumimnmhp').naughty?
    assert MoralString.new('haegwjzuvuyypxyu').naughty?
    assert MoralString.new('dvszwmarrgswjxmb').naughty?
    assert_equal 236, Day5.count_nice_strings(@input)
  end

  def test_part_2
    assert BetterMoralString.new('qjhvhaaatzxzqqjkmpb').naughty?
    assert BetterMoralString.new('qjhvhtzxzqqjkmpb').nice?
    assert BetterMoralString.new('xxyxx').nice?
    assert BetterMoralString.new('uurcxstgmygtbstg').naughty?
    assert BetterMoralString.new('ieodomkazucvgmuy').naughty?
    assert_equal 12345678, Day5.count_nicer_strings2(@input)
  end
end
