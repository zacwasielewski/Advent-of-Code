#!/usr/bin/env ruby

def wrap_ribbon(l, w, h)
  [l, w, h].sort.take(2).reduce(:+) * 2
end

def bow_ribbon(l, w, h)
  [l, w, h].reduce(:*)
end

def parse_box_dimensions(box)
  box.split('x').map(&:to_i)
end

def ribbon_for(box)
  l, w, h = parse_box_dimensions(box)
  wrap_ribbon(l, w, h) + bow_ribbon(l, w, h)
end

def total_ribbon(input)
  input.readlines.map{|box| ribbon_for(box)}.reduce(:+)
end
