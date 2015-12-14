#!/usr/bin/env ruby

module Day11
  def self.solve_part_1(input)
  end

  def self.solve_part_2(input)
  end
end

class SantaPassword
  def initialize(password)
    @password = password
  end

  def to_s
    @password
  end

  def increment
    password = next_password(@password)
    until valid?(password)
      password = next_password(password)
    end
    @password = password
  end

  def valid?(password = nil)
    password = @password if password.nil?
    return false if !any_increasing_straight_of_3_letters? password
    return false if  any_ambiguous_characters? password
    return false if !at_least_two_different_nonoverlapping_letter_pairs? password
    true
  end

  private

  def next_password(password)
    password.succ
  end

  # Passwords must include one increasing straight of at least three letters,
  # like abc, bcd, cde, and so on, up to xyz. They cannot skip letters; abd
  # doesn't count.
  def any_increasing_straight_of_3_letters?(password)
    letters = password.chars
    straights = letters.each_with_index.
      chunk{|letter, i| letter.succ == letters[i+1] }.
      select{|is_straight, i| is_straight == true }.
      map{|n| n[1].size + 1}
    (straights.max || 0) >= 3
  end

  # Passwords may not contain the letters i, o, or l, as these letters can
  # be mistaken for other characters and are therefore confusing.
  def any_ambiguous_characters?(password)
    password.match(/[iol]/)
  end

  # Passwords must contain at least two different, non-overlapping
  # pairs of letters, like aa, bb, or zz.
  def at_least_two_different_nonoverlapping_letter_pairs?(password)
    letters = password.chars
    letter_pairs = letters.each_cons(2).select{|n| n[0]==n[1]}.map{|n| n}
    letter_pairs.uniq.length >= 2
  end
end
