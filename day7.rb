#!/usr/bin/env ruby

module Day7
  def self.solve_part_1(input)
    @circuit = Circuit.new
    input.strip.split("\n").each {|str| @circuit.connect(str) }
    @circuit[:a]
  end

  def self.solve_part_2(input)
    @circuit = Circuit.new
    input.strip.split("\n").each {|str| @circuit.connect(str) }
    @circuit.connect("956 -> b")
    @circuit.connect('lx -> a')
    @circuit[:a]
  end
end

class Circuit
  attr_accessor :wires

  def initialize
    @wires = {}
  end

  def connect(str)
    wire, signal = parse_connection(str)
    @wires[wire] = signal
  end

  def [](n)
    eval_wire_connection @wires[n]
  end

  private

  def parse_connection(str)
    signal, wire = str.split(' -> ')
    [wire.to_sym, parse_signal(signal)]
  end

  def parse_signal(str)
    tokens = str.split(' ')
    case tokens.length
    when 1
      return coerce_operand(tokens.first)
    when 2
      operator, op1 = tokens
      operands = [op1]
    when 3
      op1, operator, op2 = tokens
      operands = [op1, op2]
    end
    [operator, operands.map{|s| coerce_operand s }]
  end

  def eval_wire_connection(expr)
    case expr.class.to_s
    when 'Symbol'
      return eval_wire_connection @wires[expr]
    when 'Fixnum'
      return expr
    when 'Array'
      operator, operands = expr
      operands.map!{|s|
        s.instance_of?(Symbol) ? eval_wire_connection(@wires[s]) : s
      }
      return calc_gate(operator, operands)
    end
  end

  def calc_gate(operator, operands)
    case operator
    when 'NOT'
      return bitwise_not operands[0]
    when 'AND'
      return operands[0] &  operands[1]
    when 'OR'
      return operands[0] |  operands[1]
    when 'LSHIFT'
      return operands[0] << operands[1]
    when 'RSHIFT'
      return operands[0] >> operands[1]
    when nil
      return operands[0]
    end
  end

  def coerce_operand(operand)
    return operand.to_sym if is_wire?  operand
    return operand.to_i   if is_value? operand
  end

  def bitwise_not(num)
    num.to_i.to_s(2).rjust(16, '0').each_char.map{|b| (b.to_i-1).abs}.join.to_i(2)
  end
end
