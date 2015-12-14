require 'minitest/autorun'
require 'json'
require './day12.rb'

class TestDay12 < Minitest::Test
  def setup
    @input = File.read("./input/input_day12.json")
  end

  def test_sample_data
    assert_equal 6, JSONAbacus.new('[1,2,3]').sum
    assert_equal 6, JSONAbacus.new('{"a":2,"b":4}').sum
    assert_equal 3, JSONAbacus.new('[[[3]]]').sum
    assert_equal 3, JSONAbacus.new('{"a":{"b":4},"c":-1}').sum
    assert_equal 0, JSONAbacus.new('{"a":[-1,1]}').sum
    assert_equal 0, JSONAbacus.new('[-1,{"a":1}]').sum
    assert_equal 0, JSONAbacus.new('[]').sum
    assert_equal 0, JSONAbacus.new('{}').sum
  end

  def test_part_1
    assert_equal 119433, JSONAbacus.new(@input).sum
  end

  def test_part_2
  end
end
