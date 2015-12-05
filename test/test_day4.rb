require 'minitest/autorun'
require './day4.rb'

class TestDay4 < Minitest::Test
  def setup
  end

  def test_part_1
    assert_equal 609043,  first_adventcoin_for('abcdef')
    assert_equal 1048970, first_adventcoin_for('pqrstuv')
    assert_equal 282749,  first_adventcoin_for('yzbqklnj')
  end

  def test_part_2
    assert_equal 9962624,  first_adventcoin6_for('yzbqklnj')
  end
end
