require 'minitest/autorun'
require './day7.rb'

class TestDay7 < Minitest::Test
  def setup
    @input = File.open("./input/input_day7.txt").read
  end

  def test_part_1
    assert_equal 956, Day7.solve_part_1(@input)
  end

  def test_part_2
    #assert_equal 15343601, Day6.solve_part_2(@input)
  end
end

class TestCircuit < Minitest::Test
  def setup
    @circuit = Circuit.new
  end

  def test_basic_connect
    @circuit.connect('123 -> x')
    @circuit.connect('x AND y -> z')
    @circuit.connect('p LSHIFT 2 -> q')
    @circuit.connect('NOT e -> f')
    @circuit.connect('234 -> y')
    @circuit.connect('345 -> p')
    @circuit.connect('456 -> e')
    assert_equal 123, @circuit[:x]
    assert_equal 106,  @circuit[:z]
    assert_equal 1380, @circuit[:q]
    assert_equal 65_079, @circuit[:f]
  end

  def test_sample
    @circuit.connect '123 -> x'
    @circuit.connect '456 -> y'
    @circuit.connect 'x AND y -> d'
    @circuit.connect 'x OR y -> e'
    @circuit.connect 'x LSHIFT 2 -> f'
    @circuit.connect 'y RSHIFT 2 -> g'
    @circuit.connect 'NOT x -> h'
    @circuit.connect 'NOT y -> i'
    assert_equal 72, @circuit[:d]
    assert_equal 507, @circuit[:e]
    assert_equal 492, @circuit[:f]
    assert_equal 114, @circuit[:g]
    assert_equal 65412, @circuit[:h]
    assert_equal 65079, @circuit[:i]
    assert_equal 123, @circuit[:x]
    assert_equal 456, @circuit[:y]
  end
end
