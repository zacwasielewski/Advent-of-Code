require 'minitest/autorun'
require './day11.rb'

class TestDay11 < Minitest::Test
  def setup
    @input = 'cqjxjnds'
  end

  def test_sample_data
    refute SantaPassword.new('hijklmmn').valid?
    refute SantaPassword.new('abbceffg').valid?
    refute SantaPassword.new('abbcegjk').valid?
    assert SantaPassword.new('pqqrstuvwwxyz').valid?
    assert_equal 'abcdffaa', SantaPassword.new('abcdefgh').increment
    assert_equal 'ghjaabcc', SantaPassword.new('ghijklmn').increment
  end

  def test_part_1
    assert_equal 'cqjxxyzz', SantaPassword.new(@input).increment
  end

  def test_part_2
    assert_equal 'cqkaabcc', SantaPassword.new( SantaPassword.new(@input).increment ).increment
  end
end
