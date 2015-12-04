#!/usr/bin/env ruby

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
