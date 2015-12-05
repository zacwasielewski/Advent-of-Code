#!/usr/bin/env ruby

require 'digest/md5'

def adventcoins(secret_key, prefix = '00000')
  (1..Float::INFINITY).lazy.find_all { |i|
    md5 = Digest::MD5.hexdigest(secret_key + i.to_s)
    md5[0, prefix.length] == prefix
  }
end

def first_adventcoin_for(secret_key)
  adventcoins(secret_key).first(1).at(0)
end

def first_adventcoin6_for(secret_key)
  adventcoins(secret_key, '000000').first(1).at(0)
end
