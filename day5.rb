#!/usr/bin/env ruby

require 'digest/md5'

module Day5

  def self.count_nice_strings(input)
    input.strip.split("\n").select{|str|
      MoralString.new(str).nice?
    }.length
  end

  def self.count_nicer_strings(input)
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
    #puts self
    any_repeated_nonoverlapping_letter_pairs?
  end

  def naughty?
    !nice?
  end

  private

  def any_repeated_nonoverlapping_letter_pairs?
    return false if any_overlapping_letter_pairs?
    pairs = letter_pairs
    pairs.each_with_index{ |current_pair, i|
      compare_to_pairs = pairs.drop(i+1)
      return true if compare_to_pairs.include? current_pair
    }
    false
  end

  def any_overlapping_letter_pairs?
    letter_pairs.chunk{|p| p}.map{|_, pairs| pairs.size }.max > 1
  end

  #def remove_consecutive_duplicates(arr)
  #  arr.chunk{|x| x}.map(&:first)
  #end

  def letter_pairs
    self.split('').each_cons(2).map(&:join)
  end
end
