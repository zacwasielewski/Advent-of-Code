#!/usr/bin/env ruby

module Day14
  def self.solve_part_1(input, time)
    reindeer = input.readlines.map {|str|
      name, speed, flight_time, rest_time = ReindeerTravel.parse_rule(str)
      Reindeer.new(name, speed, flight_time, rest_time).distance_after(time)
    }.max
  end

  def self.solve_part_2(input)
  end
end

class ReindeerTravel
  def self.parse_rule(str)
    # Comet can fly 14 km/s for 10 seconds, but then must rest for 127 seconds.
    str.scan(/^([A-Z][a-z]+) can fly (\d+) km\/s for (\d+) seconds, but then must rest for (\d+) seconds./).first
  end
end

class Reindeer
  def initialize(name, speed, flight_time, rest_time)
    @name = name
    @speed = speed.to_i
    @flight_time = flight_time.to_i
    @rest_time = rest_time.to_i
  end

  def distance_after(seconds)
    quotient, remainder = seconds.divmod(@flight_time + @rest_time)
    (quotient * @flight_time * @speed) + [remainder * @speed, @flight_time * @speed].min
  end

  def old_distance_after(seconds)
    time_elapsed = 0
    distance = 0
    current_flight = 0
    current_rest = 0
    status = :flying
    for i in 1..seconds
      case status
      when :flying
        current_flight += 1
        distance += @speed
      when :resting
        current_rest += 1
      end

      if current_flight == @flight_time
        current_flight = 0
        status = :resting
      end
      if current_rest == @rest_time
        current_rest = 0
        status = :flying
      end
    end
    distance
  end
end
