#!/usr/bin/env ruby

require 'digest/md5'

class Day4
  def initialize(secret_key)
    @secret_key = secret_key
  end

  def lowest_number_to_produce_adventcoin
    adventcoin_producers(default_filter).first(1).at(0)
  end

  def lowest_number_to_produce_adventcoin6
    filter = -> (s){ s.start_with? '000000' }
    adventcoin_producers(filter).first(1).at(0)
  end

  private

  def adventcoin_producers(filter)
    (1..Float::INFINITY).lazy.find_all { |i|
      hash = Digest::MD5.hexdigest(@secret_key + i.to_s)
      filter.call(hash)
    }
  end

  def default_filter
    -> (s){ s.start_with? '00000' }
  end
end
