#!/usr/bin/env ruby

def move_from(house, direction)
  x, y = house
  case direction
  when '^'
    house = [ x, y+1 ]
  when 'v'
    house = [ x, y-1 ]
  when '>'
    house = [ x+1, y ]
  when '<'
    house = [ x-1, y ]
  end
  house
end

def deliver_presents(input)
  house = [0, 0]
  houses = [ house ]
  input.strip.each_char { |direction|
    house = move_from(house, direction)
    houses << house
  }
  houses
end

def unique_houses_visited_by_santa(input)
  deliver_presents(input).uniq.size
end

def unique_houses_visited_by_santa_and_robosanta(input)
  even_indexes = (0..input.length-1).select(&:even?)
  odd_indexes  = (0..input.length-1).select(&:odd?)
  santa     = input.chars.values_at( *even_indexes ).join
  robosanta = input.chars.values_at( *odd_indexes  ).join

  (deliver_presents(santa) + deliver_presents(robosanta)).uniq.size
end
