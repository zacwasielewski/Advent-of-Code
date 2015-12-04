#!/usr/bin/env ruby

require 'digest/md5'

def adventcoins(secret_key, prefix = '00000')
  (1..Float::INFINITY).lazy.find_all { |i|
    md5 = Digest::MD5.hexdigest(secret_key + i.to_s)
    md5[0, prefix.length] == prefix
  }
end

def adventcoins_for(*args)
  case args.size
  when 2
    secret_key, num = args
    adventcoins(secret_key).first(num)
  when 3
    secret_key, prefix, num = args
    adventcoins(secret_key, prefix).first(num)
  end
end

def first_adventcoin_for(secret_key)
  adventcoins_for(secret_key, 1).at(0)
end

def first_adventcoin6_for(secret_key)
  adventcoins_for(secret_key, '000000', 1).at(0)
end
