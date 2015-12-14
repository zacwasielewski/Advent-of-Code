#!/usr/bin/env ruby

module Day12
  def self.solve_part_1(input)
  end

  def self.solve_part_2(input)
  end
end

class JSONAbacus
  def initialize(input)
    @json = parse_json_string input
  end

  def parse_json_string(input)
    JSON.parse(input)
  end

  def sum
    @json.to_s.scan(/-?\d+/).map(&:to_i).reduce(:+) || 0
    #@json.flatten(1000).select{|n| n.is_a? Numeric }.reduce(:+)
  end
end
