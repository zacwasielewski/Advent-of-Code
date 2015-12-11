require 'minitest/autorun'
require './day8.rb'

class TestDay8 < Minitest::Test
  def setup
    @input = File.open("./input/input_day8.txt").read
  end

  def test_sample_data
    s1 = %q("");
    s2 = %q("abc");
    s3 = %q("aaa\"aaa");
    s4 = %q("\x27");

    assert_equal 0, StringLiteral.new(s1).to_s.length
    assert_equal 3, StringLiteral.new(s2).to_s.length
    assert_equal 7, StringLiteral.new(s3).to_s.length
    assert_equal 1, StringLiteral.new(s4).to_s.length

    assert_equal 2, s1.length - StringLiteral.new(s1).to_s.length
    assert_equal 2, s2.length - StringLiteral.new(s2).to_s.length
    assert_equal 3, s3.length - StringLiteral.new(s3).to_s.length
    assert_equal 5, s4.length - StringLiteral.new(s4).to_s.length

    assert_equal 1, StringLiteral.new('"x"').to_s.length

    assert_equal 29, StringLiteral.new(%q("sjdivfriyaaqa\xd2v\"k\"mpcu\"yyu\"en")).to_s.length
    assert_equal 30, StringLiteral.new(%q("xrgcripdu\x4c\xc4gszjhrvumvz\"mngbirb")).to_s.length

    # "cwkljukxer\\\"\\nff\"esjwiyaoy" 32 - 26 = 6
    # "xziq\\\x18ybyv\x9am\"neacoqjzytertisysza" 42 - 32 = 10
    # "\"vhzlbwq\"xeimjt\\xe\x85umho\"m\"\"bmy" 41 - 30 = 11
    assert_equal 27, File.open("./input/input_day8_sample.txt").read.strip.split("\n").map{|str|
      str.length - StringLiteral.new(str).to_s.length
    }.reduce(:+)

    # Part 2

    assert_equal 6,  StringLiteral.new(s1).to_literal.length
    assert_equal 9,  StringLiteral.new(s2).to_literal.length
    assert_equal 16, StringLiteral.new(s3).to_literal.length
    assert_equal 11, StringLiteral.new(s4).to_literal.length

    assert_equal 4, StringLiteral.new(s1).to_literal.length - s1.length
    assert_equal 4, StringLiteral.new(s2).to_literal.length - s2.length
    assert_equal 6, StringLiteral.new(s3).to_literal.length - s3.length
    assert_equal 5, StringLiteral.new(s4).to_literal.length - s4.length
  end

  def test_part_1
    assert_equal 1333, Day8.solve_part_1(@input) # 1159 = too low ; 1342 = too high
  end

  def test_part_2
    assert_equal 40149, Day8.solve_part_2(@input)
  end
end
