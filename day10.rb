#!/usr/bin/env ruby

module Day10
  def self.solve_part_1(input)
    memo = input
    40.times do
      memo = look_and_say(memo)
    end
    memo.length
  end

  def self.solve_part_2(input)
    50.times.reduce(input) {|memo| look_and_say memo }.length
  end

  def self.look_and_say(input)
    input.chars.chunk{|e| e}.map{|e| e.last.length.to_s + e.first }.join
    #input.chars.chunk{|c| c}.map{|e| [e.last.length, e.first].join }.join
  end
end
