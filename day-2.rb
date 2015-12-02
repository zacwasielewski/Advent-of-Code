#!/usr/bin/env ruby

require 'open-uri'
require 'benchmark'

INPUT_FILE = "./day-2-input.txt"

def surface_area(l, w, h)
  2*l*w + 2*w*h + 2*h*l
end

# slack = area of the smallest side
def slack(l, w, h)
  [l, w, h].sort.take(2).reduce(:*)
end

def parse_box_dimensions(box)
  box.split('x').map(&:to_i)
end

def wrapping_paper_for(box)
  l, w, h = parse_box_dimensions(box)
  surface_area(l, w, h) + slack(l, w, h)
end

total_wrapping_paper = File.open(INPUT_FILE){|file|
  file.readlines.map{|box| wrapping_paper_for(box)}.reduce(:+)
}
puts total_wrapping_paper
