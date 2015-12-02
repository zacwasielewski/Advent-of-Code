#!/usr/bin/env ruby

# Strategy 1: loop through input characters and increment/decrement a counter
# Strategy 2: map input characters to positive/negative integers, then sum
# Strategy 3: substract # of closing parens from # of opening parens

require 'open-uri'
require 'benchmark'

INPUT_FILE = "./day-1-input.txt"
INPUT = File.open(INPUT_FILE).read.strip

def optimize_input(input)
  optimized = ''
  loop do
    optimized = trim_matching_pairs(input)
    #puts "INPUT: " + input.length.to_s + "\n"
    #puts "optimized: " + optimized.length.to_s + "\n"
    break if optimized.length === input.length
    input = optimized
  end
  optimized
end

def trim_matching_pairs(input)
  input
    .gsub('()','')
    .gsub(')(','')
end

#time = Benchmark.realtime do
#  #INPUT = optimize_input(INPUT)
#  INPUT = trim_matching_pairs(INPUT)
#end
#optimization_time = time
#puts "Optimization time #{time*1000} milliseconds"

puts "\n### Strategy 2:\n"

puts "\n2:"
time = Benchmark.realtime do
  puts INPUT.tr('()', '+-').chars.map{|op| 0.send(op.to_sym, 1) }.reduce(:+)
end
puts "Time elapsed #{time*1000} milliseconds"
#puts "Total time #{(time + optimization_time)*1000} milliseconds"

puts "\n3:"
time = Benchmark.realtime do
  puts INPUT.chars.map{|paren|
    case paren
    when '('
      1
    when ')'
      -1
    end
  }.reduce(:+)
end
puts "Time elapsed #{time*1000} milliseconds"
#puts "Total time #{(time + optimization_time)*1000} milliseconds"

puts "\n5:"
time = Benchmark.realtime do
  subs = ['(',')'].zip([1,-1]).to_h
  puts INPUT.chars.map{ |paren|
    subs.fetch(paren)
  }.reduce(:+)
end
puts "Time elapsed #{time*1000} milliseconds"
#puts "Total time #{(time + optimization_time)*1000} milliseconds"

puts "\n6:"
time = Benchmark.realtime do
  input = INPUT.chars.join('|')
  input.gsub!('(', '1')
  input.gsub!(')', '-1')
  puts input.split('|').map(&:to_f).reduce(:+)
end
puts "Time elapsed #{time*1000} milliseconds"
#puts "Total time #{(time + optimization_time)*1000} milliseconds"

puts "\n1:"
time = Benchmark.realtime do
  puts INPUT.chars.reduce(0){|level, paren|
    case paren
    when '('
      level + 1
    when ')'
      level - 1
    end
  }
end
puts "Time elapsed #{time*1000} milliseconds"
#puts "Total time #{(time + optimization_time)*1000} milliseconds"

puts "\n### Strategy 3:\n"

puts "\n7:"
time = Benchmark.realtime do
  puts INPUT.scan('(').count - INPUT.scan(')').count
end
puts "scan() #{time*1000} milliseconds"

puts "\n8:"
time = Benchmark.realtime do
  num_open  = INPUT.gsub(')','').length
  num_close = INPUT.gsub('(','').length
  puts num_open - num_close
end
puts "gsub() #{time*1000} milliseconds"
