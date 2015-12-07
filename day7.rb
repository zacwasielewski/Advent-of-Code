#!/usr/bin/env ruby

module Day6
  def self.solve_part_1(input)
    #@circuit = Circuit.new
    #input.strip.split("\n").each {|str| @circuit.connect(str) }
    #@circuit.on_count
  end

  def self.solve_part_2(input)
    #@lights = DimmableLights.new
    #input.strip.split("\n").each {|str| @lights.change(str) }
    #@lights.total_brightness
  end
end

class Circuit
  def initialize
    @wires = {}
  end

  def get_wire(n)
    @wires[n.to_sym]
  end

  def connect(str)
    signal, wire = parse_connection(str)
    send_signal_to_wire(signal, wire)
  end

  private

  def parse_connection(str)
    gate_str, wire = str.split(' -> ')
    signal = calc_signal( *parse_gate(gate_str) )
    [signal, wire.to_sym]
  end

  def send_signal_to_wire(signal, wire)
    @wires[wire] = signal
  end

  def parse_gate(str)
    tokens = str.split(' ')
    case tokens.length
    when 1
      operands = tokens
    when 2
      operator, operands = tokens
    when 3
      op1, operator, op2 = tokens
      operands = [op1, op2]
    end
    [operator, operands]
  end

  def calc_signal(operator, operands)
    op1 = to_signal(operands[0])
    op2 = to_signal(operands[1])
    case operator
    when 'NOT'
      return bitwise_not op1
    when 'AND'
      return op1 & op2
    when 'OR'
      return op1 | op2
    when 'LSHIFT'
      return op1 << op2
    when 'RSHIFT'
      return op1 >> op2
    else
      return op1
    end
  end

  def bitwise_not(num)
    num.to_i.to_s(2).rjust(16, '0').each_char.map{|b| (b.to_i-1).abs}.join.to_i(2)
  end

  def to_signal(value)
    case value.class.to_s
    when 'Fixnum'
      signal = value
    when 'String'
      signal = value.match(/^(\d)+$/) ? value.to_i : @wires[value.to_sym]
    end
    signal
  end
end
