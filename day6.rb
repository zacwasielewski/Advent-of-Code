#!/usr/bin/env ruby

require 'matrix'

module Day6
  def self.solve_part_1(input)
    @lights = Lights.new
    input.strip.split("\n").each {|str| @lights.change(str) }
    @lights.on_count
  end

  def self.solve_part_2(input)
    @lights = DimmableLights.new
    input.strip.split("\n").each {|str| @lights.change(str) }
    @lights.total_brightness
  end
end

class Lights
  def initialize
    @grid = Matrix.build(1000, 1000){ false }
  end

  def change(str)
    command, startxy, endxy = parse_instructions str

    @grid.each_with_index do |e, row, col|
      next if row < startxy[0] || row > endxy[0]
      next if col < startxy[1] || col > endxy[1]
      case command
      when 'on'
        @grid.send(:[]=, row, col, true)
      when 'off'
        @grid.send(:[]=, row, col, false)
      when 'toggle'
        @grid.send(:[]=, row, col, !e)
      end
    end

    self
  end

  def on_count
    @grid.map{|e| { :true => 1, :false => 0 }[e.to_s.to_sym] }.reduce(:+)
  end

  private

  def parse_instructions(str)
    str.gsub!('turn ','') # drop some cruft
    command, startxy, _, endxy = str.split ' '
    [ command,
      startxy.split(',').map(&:to_i),
      endxy.split(',').map(&:to_i) ]
  end
end


class DimmableLights
  def initialize
    @grid = Matrix.build(1000, 1000){ 0 }
  end

  def change(str)
    command, startxy, endxy = parse_instructions str

    @grid.each_with_index do |e, row, col|
      next if row < startxy[0] || row > endxy[0]
      next if col < startxy[1] || col > endxy[1]
      commands = {
        'on'     => -> { brighten(e) },
        'off'    => -> { dim(e) },
        'toggle' => -> { brighten(e, 2) }
      }
      @grid.send(:[]=, row, col, commands[command].call)
    end

    self
  end

  def dim(brightness, amount = 1)
    brightness -= amount
    return 0 if brightness < 0
    brightness
  end

  def brighten(brightness, amount = 1)
    brightness += amount
  end

  def total_brightness
    @grid.reduce(:+)
  end

  private

  def parse_instructions(str)
    str.gsub!('turn ','') # drop some cruft
    command, startxy, _, endxy = str.split ' '
    [ command,
      startxy.split(',').map(&:to_i),
      endxy.split(',').map(&:to_i) ]
  end
end
