require 'minitest/autorun'
require './day7.rb'

class TestDay7 < Minitest::Test
  def setup
    @input = File.open("./input/input_day7.txt").read
  end

  def test_part_1
    #assert_equal 400410, Day6.solve_part_1(@input)
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
    @circuit.connect('234 -> y')
    @circuit.connect('345 -> p')
    @circuit.connect('456 -> e')
    @circuit.connect('x AND y -> z')
    @circuit.connect('p LSHIFT 2 -> q')
    @circuit.connect('NOT e -> f')
    assert_equal 123, @circuit.get_wire(:x)
    assert_equal 106,  @circuit.get_wire(:z)
    assert_equal 1380, @circuit.get_wire(:q)
    assert_equal 65_079, @circuit.get_wire(:f)
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
    assert_equal 72, @circuit.get_wire(:d)
    assert_equal 507, @circuit.get_wire(:e)
    assert_equal 492, @circuit.get_wire(:f)
    assert_equal 114, @circuit.get_wire(:g)
    assert_equal 65412, @circuit.get_wire(:h)
    assert_equal 65079, @circuit.get_wire(:i)
    assert_equal 123, @circuit.get_wire(:x)
    assert_equal 456, @circuit.get_wire(:y)
  end
end
