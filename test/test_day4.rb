require 'minitest/autorun'
require './day4.rb'

class TestDay4 < Minitest::Test
  def setup
  end

  def test_part_1
    assert_equal 609043,  Day4.new('abcdef').lowest_number_to_produce_adventcoin
    assert_equal 1048970, Day4.new('pqrstuv').lowest_number_to_produce_adventcoin
    assert_equal 282749,  Day4.new('yzbqklnj').lowest_number_to_produce_adventcoin
  end

  def test_part_2
    assert_equal 9962624,  Day4.new('yzbqklnj').lowest_number_to_produce_adventcoin6
  end
end
