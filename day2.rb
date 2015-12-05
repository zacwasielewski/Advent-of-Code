#!/usr/bin/env ruby

class Day2
  def initialize(input)
    @lines = input.split("\n")
  end

  def total_square_feet_of_wrapping_paper
    @lines.map{|box| wrapping_paper_for(box)}.reduce(:+)
  end

  def total_ribbon
    @lines.map{|box| ribbon_for(box)}.reduce(:+)
  end

  private

  def wrapping_paper_for(box)
    l, w, h = parse_box_dimensions(box)
    surface_area(l, w, h) + slack(l, w, h)
  end

  def ribbon_for(box)
    l, w, h = parse_box_dimensions(box)
    wrap_ribbon(l, w, h) + bow_ribbon(l, w, h)
  end

  def parse_box_dimensions(box)
    box.split('x').map(&:to_i)
  end
  
  def surface_area(l, w, h)
    2*l*w + 2*w*h + 2*h*l
  end

  def slack(l, w, h)
    [l, w, h].sort.take(2).reduce(:*)
  end

  def wrap_ribbon(l, w, h)
    [l, w, h].sort.take(2).reduce(:+) * 2
  end

  def bow_ribbon(l, w, h)
    [l, w, h].reduce(:*)
  end

end
