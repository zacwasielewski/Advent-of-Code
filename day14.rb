#!/usr/bin/env ruby

module Day14
  def self.solve_part_1(input, time)
    reindeer = input.readlines.map {|str|
      Reindeer.new(*ReindeerTravel.parse_rule(str)).distance_after(time)
    }.max
  end

  def self.solve_part_2(input, time)
    reindeer = input.readlines.map {|str|
      Reindeer.new(*ReindeerTravel.parse_rule(str))
    }
    scores = Hash[reindeer.map {|r| [r.name, 0]}]
    for t in 1..time
      standings = Hash[reindeer.map{|r| [r.name, r.distance_after(t)]}]
      reindeer.select{|r| standings[r.name] == standings.values.max}.each{|r| scores[r.name] += 1 }
    end
    scores.values.max
  end
end

class ReindeerTravel
  def self.parse_rule(str)
    # Comet can fly 14 km/s for 10 seconds, but then must rest for 127 seconds.
    str.scan(/^([A-Z][a-z]+) can fly (\d+) km\/s for (\d+) seconds, but then must rest for (\d+) seconds./).first
  end
end

class Reindeer
  attr_accessor :name

  def initialize(name, speed, flight_time, rest_time)
    @name = name
    @speed = speed.to_i
    @flight_time = flight_time.to_i
    @rest_time = rest_time.to_i
  end

  def distance_after(time)
    quotient, remainder = time.divmod(@flight_time + @rest_time)
    (quotient * @flight_time * @speed) + [remainder * @speed, @flight_time * @speed].min
  end
end
