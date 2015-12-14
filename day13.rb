#!/usr/bin/env ruby

module Day13
  def self.solve_part_1(input)
    @dinner_table = DinnerTable.new
    input.strip.split("\n").each {|str| @dinner_table.parse_seating_rule(str) }
    @dinner_table.optimal_total_happiness
  end

  def self.solve_part_2(input)
    @dinner_table = DinnerTable.new
    input.strip.split("\n").each {|str| @dinner_table.parse_seating_rule(str) }
    @dinner_table.guest_preferences.keys.each do |guest|
      @dinner_table.add_preference(:Zac, guest, 0)
      @dinner_table.add_preference(guest, :Zac, 0)
    end
    @dinner_table.optimal_total_happiness
  end
end

class DinnerTable
  attr_accessor :guest_preferences

  def initialize
    @guest_preferences = {}
  end

  def parse_seating_rule(str)
    guest, neighbor = str.scan(/[A-Z][a-z]+/)
    guest_happiness = str.scan(/\d+/).first.to_i
    guest_happiness *= -1 if str.scan(/ lose /).size > 0
    add_preference(guest.to_sym, neighbor.to_sym, guest_happiness)
  end

  def add_preference(guest, neighbor, guest_happiness)
    @guest_preferences[guest] ||= {}
    @guest_preferences[guest][neighbor] = guest_happiness
  end

  def optimal_total_happiness
    @guest_preferences.keys.permutation.to_a.map{|order| total_happiness_for order}.max
  end

  private

  def total_happiness_for(guests_in_order)
    guests_in_order << guests_in_order[0] << guests_in_order[1]
    guests_in_order.each_cons(3).map{|neighbor1, guest, neighbor2|
      [ happiness_for(guest, neighbor1),
        happiness_for(guest, neighbor2) ]
    }.flatten.reduce(:+)
  end

  def happiness_for(guest, neighbor)
    @guest_preferences[guest][neighbor]
  end
end
