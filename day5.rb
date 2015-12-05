#!/usr/bin/env ruby

module Day5
  def self.solve_part_1(input)
    input.strip.split("\n").select{|str|
      MoralString.new(str).nice?
    }.length
  end

  def self.solve_part_2(input)
    input.strip.split("\n").select{|str|
      BetterMoralString.new(str).nice?
    }.length
  end
end

class MoralString < String
  DISALLOWED = %w(ab cd pq xy)
  MINIMUM_VOWELS = 3

  def nice?
    enough_vowels? && consecutive_letters? && !disallowed_substrings?
  end

  def naughty?
    !nice?
  end

  private

  def enough_vowels?
    self.scan(/[aeiou]/).length >= MINIMUM_VOWELS
  end

  def consecutive_letters?
    self.length != self.squeeze.length
  end

  def disallowed_substrings?
    DISALLOWED.any? { |s| self.match(s) }
  end
end

class BetterMoralString < String

  def nice?
    any_repeated_nonoverlapping_letter_pairs? &&
      any_letters_with_identical_neighbors?
  end

  def naughty?
    !nice?
  end

  private

  def any_repeated_nonoverlapping_letter_pairs?
    letter_pairs.map{|pair| self.scan(pair).size > 1 }.any?
  end

  def any_letters_with_identical_neighbors?
    letters.each_cons(3).any? {|n| n[0] == n[2] }
  end

  def letter_pairs
    letters.each_cons(2).map(&:join)
  end

  def letters
    self.split('')
  end

  #def any_overlapping_letter_pairs?
  #  letter_pairs.chunk{|p| p}.map{|_, pairs| pairs.size }.max > 1
  #end

  #def remove_consecutive_duplicates(arr)
  #  arr.chunk{|x| x}.map(&:first)
  #end
end
