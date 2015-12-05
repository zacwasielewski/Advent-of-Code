#!/usr/bin/env ruby

require 'digest/md5'

class Day4
  def initialize(secret_key)
    @secret_key = secret_key
  end

  def lowest_number_to_produce_adventcoin
    adventcoins.first(1).at(0)
  end

  def lowest_number_to_produce_adventcoin6
    adventcoins('000000').first(1).at(0)
  end

  private

  def adventcoins(prefix = '00000')
    (1..Float::INFINITY).lazy.find_all { |i|
      md5 = Digest::MD5.hexdigest(@secret_key + i.to_s)
      md5[0, prefix.length] == prefix
    }
  end
end
