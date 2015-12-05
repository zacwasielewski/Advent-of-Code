#!/usr/bin/env ruby

class Day3
  def initialize(input)
    @input = input.strip
  end

  def unique_houses_visited_by_santa
    deliver_presents(@input).uniq.size
  end

  def unique_houses_visited_by_santa_and_robosanta
    even_indexes = (0..@input.length-1).select(&:even?)
    odd_indexes  = (0..@input.length-1).select(&:odd?)

    santa     = @input.chars.values_at( *even_indexes ).join
    robosanta = @input.chars.values_at( *odd_indexes  ).join

    (deliver_presents(santa) + deliver_presents(robosanta)).uniq.size
  end

  private

  def deliver_presents(input)
    start_house = [0, 0]
    input.split('').reduce([start_house]) do |houses, direction|
      houses << move_from(houses.last, direction)
    end
  end

  def move_from(house, direction)
    x, y = house
    { '^' => -> { y += 1 },
      'v' => -> { y -= 1 },
      '>' => -> { x += 1 },
      '<' => -> { x -= 1 }
    }[direction].call
    [x, y]
  end

end
