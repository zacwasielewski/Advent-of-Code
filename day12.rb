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
  end

  def sum_without_red
    flatten_mixed(@json).select{|n| n.is_a? Numeric }.reduce(:+)
  end

  def flatten_mixed(object, levels=nil)
    return object if !object.respond_to? :each
    if object.is_a? Hash
      return if object.flatten.select{|o| !o.respond_to? :each}.index('red') != nil
      return object.map {|key, value| [ key, flatten_mixed(value) ] }.flatten
    end
    if object.is_a? Array
      return object.map {|value| flatten_mixed(value) }.flatten
    end
  end
end
