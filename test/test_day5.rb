require 'minitest/autorun'
require './day5.rb'

class TestMoralString < Minitest::Test
  def test_naughty_or_nice
    assert MoralString.new('ugknbfddgicrmopn').nice?
    assert MoralString.new('aaa').nice?
    assert MoralString.new('jchzalrnumimnmhp').naughty?
    assert MoralString.new('haegwjzuvuyypxyu').naughty?
    assert MoralString.new('dvszwmarrgswjxmb').naughty?
  end
end

class TestBetterMoralString < Minitest::Test
  def test_naughty_or_nice
    assert BetterMoralString.new('qjhvhtzxzqqjkmpb').nice?
    assert BetterMoralString.new('xxyxx').nice?
    assert BetterMoralString.new('uurcxstgmygtbstg').naughty?
    assert BetterMoralString.new('ieodomkazucvgmuy').naughty?
  end
end

class TestDay5 < Minitest::Test
  def setup
    @input = File.open("./input/input_day5.txt").read
  end

  def test_part_1
    assert_equal 236, Day5.solve_part_1(@input)
  end

  def test_part_2
    assert_equal 51, Day5.solve_part_2(@input)
  end
end
