#!/usr/bin/env ruby

require 'open-uri'

INPUT_FILE = "./day-1-input.txt"
INPUT = File.open(INPUT_FILE).read.strip

def first_descent_to_basement(input)
  floor = 0
  input.split('').each_with_index do |char, n|
    floor += 1 if char === '('
    floor -= 1 if char === ')'
    if floor < 0
      return n + 1 # positions start counting at 0
    end
  end
end

puts first_descent_to_basement(INPUT)
