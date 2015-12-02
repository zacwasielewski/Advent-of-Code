#!/usr/bin/env ruby

require 'open-uri'

def surface_area(l, w, h)
  2*l*w + 2*w*h + 2*h*l
end

def slack(l, w, h)
  # slack = area of the smallest side
  [l, w, h].sort.take(2).reduce(:*)
end

def parse_box_dimensions(box)
  box.split('x').map(&:to_i)
end

def required_wrapping_paper(l, w, h)
  surface_area(l, w, h) + slack(l, w, h)
end

INPUT = "./day-2-input.txt"
File.open(INPUT){|file|

  puts file.readlines.map{|box|
    l, w, h = parse_box_dimensions(box)
    required_wrapping_paper(l, w, h)
  }.reduce(:+)

}
