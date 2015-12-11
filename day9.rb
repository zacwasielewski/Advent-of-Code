#!/usr/bin/env ruby

module Day9
  def self.solve_part_1(input)
    tsp = TravelingSalesman.new
    input.strip.split("\n").each{|line|
      tsp.add_distance( *tsp.parse_line(line) )
    }
    tsp.shortest_route
  end

  def self.solve_part_2(input)
    tsp = TravelingSalesman.new
    input.strip.split("\n").each{|line|
      tsp.add_distance( *tsp.parse_line(line) )
    }
    tsp.longest_route
  end
end

class TravelingSalesman
  attr_accessor :graph

  def initialize
    @graph = {}
  end

  def parse_line(line)
    locations, distance = line.split ' = '
    start_location, end_location = locations.split ' to '
    [start_location, end_location, distance]
  end

  def add_distance(loc1, loc2, distance)
    @graph[loc1] ||= {}
    @graph[loc2] ||= {}
    @graph[loc1][loc2] = distance.to_i
    @graph[loc2][loc1] = distance.to_i
    distance
  end

  def shortest_route
    route_lengths.min
  end

  def longest_route
    route_lengths.max
  end

  private

  def route_lengths
    @graph.keys.permutation.to_a.map{|locations|
      locations.each_cons(2).map{|n|
        distance_between(n.first, n.last)
      }.reduce(:+)
    }
  end

  def distance_between(loc1, loc2)
    @graph[loc1][loc2] || @graph[loc2][loc1]
  end
end
