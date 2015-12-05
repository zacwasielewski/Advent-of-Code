#!/usr/bin/env ruby

module Day1

  def self.santas_destination_floor(instructions)
    up   = instructions.gsub(')','').length
    down = instructions.gsub('(','').length
    up - down
  end

  def self.santas_first_descent_to_basement(instructions)
    floor = 0
    instructions.split('').each_with_index do |char, n|
      floor += 1 if char === '('
      floor -= 1 if char === ')'
      if floor < 0
        return n + 1 # positions start counting at 0
      end
    end
  end
end
