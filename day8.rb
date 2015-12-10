#!/usr/bin/env ruby

module Day8
  def self.solve_part_1(input)
    input.strip.split("\n").map{|str|
      str.length - StringLiteral.new(str).to_s.length
    }.reduce(:+)
  end

  def self.solve_part_2(input)
  end
end

class StringLiteral < SimpleDelegator
  def initialize(str)
    @str = str
    super
  end

  def to_s
    new_str = @str
    new_str = unquote(new_str)
    new_str = unescape(new_str)
    new_str
  end

  private

  def unquote(str)
    str = str.gsub(/^\"|\"$/, '')
    str = unescape_quotes str
  end

  def unescape_quotes(str)
    str.gsub(/\\"/, '"')
  end

  def unescape(str)
    str = unescape_backslashes str
    str = unescape_hex_chars str
    str
  end

  def unescape_backslashes(str)
    #str.gsub(/\\\\/, '\\')
    str.gsub(/\\\\/, 'S')
  end

  def unescape_hex_chars(str)
    str.gsub(/\\x[a-z0-9]{2}/) {|n| n.chr}
  end
end
