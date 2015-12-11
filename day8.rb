#!/usr/bin/env ruby

module Day8
  def self.solve_part_1(input)
    input.strip.split("\n").map{|str|
      str.length - StringLiteral.new(str).to_s.length
    }.reduce(:+)
  end

  def self.solve_part_2(input)
    input.strip.split("\n").map{|str|
      StringLiteral.new(str).to_literal.length - str.length
    }.reduce(:+)
  end
end

class StringLiteral < SimpleDelegator
  def initialize(str)
    @str = str
    super
  end

  def to_s
    new_str = @str
    new_str = unquote new_str
    new_str = unescape_quotes new_str
    new_str = unescape_backslashes new_str
    new_str = unescape_hex_chars new_str
    new_str
  end

  def to_literal
    new_str = @str
    #new_str = escape_hex_chars new_str
    new_str = escape_backslashes new_str
    new_str = escape_quotes new_str
    new_str = quote new_str
    new_str
  end

  private

  def quote(str)
    '"' + str + '"'
  end

  def unquote(str)
    str.gsub(/^\"|\"$/, '')
  end

  def escape_quotes(str)
    str.gsub('"', '\\"')
  end

  def unescape_quotes(str)
    str.gsub(/\\"/, '"')
  end

  def escape_backslashes(str)
    str.gsub(/\\/, '\\\\\\')
  end

  def unescape_backslashes(str)
    str.gsub(/\\\\/, 'S')
  end

  #def escape_hex_chars(str)
  #  str.gsub(/\\x[a-z0-9]{2}/) {|n| n.chr}
  #end

  def unescape_hex_chars(str)
    str.gsub(/\\x[a-z0-9]{2}/) {|n| n.chr}
  end
end
