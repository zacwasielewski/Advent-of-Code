#!/usr/bin/env ruby

def deliver_presents(input)
  current_house = [0, 0]
  houses = [ current_house ]
  input.each_char { |chr|
    x = current_house[0]
    y = current_house[1]
    case chr
    when '^'
      current_house = [ x, y+1 ]
    when 'v'
      current_house = [ x, y-1 ]
    when '>'
      current_house = [ x+1, y ]
    when '<'
      current_house = [ x-1, y ]
    end
    houses.push current_house
  }
  houses
end

def unique_houses_visited_by_santa(input)
  deliver_presents(input).uniq.size
end

def unique_houses_visited_by_santa_and_robosanta(input)
  santas_directions     = input.chars.values_at( *(0..input.length-1).select(&:even?) ).join
  robosantas_directions = input.chars.values_at( *(0..input.length-1).select(&:odd?) ).join

  (deliver_presents(santas_directions) + deliver_presents(robosantas_directions)).uniq.size
end
