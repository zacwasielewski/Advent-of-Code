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

def get_houses_visited(input)
  houses = deliver_presents(input)
  houses.uniq
end

def number_of_houses_delivered_presents(input)
  get_houses_visited(input).size
end
