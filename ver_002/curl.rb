#!/usr/bin/ruby
require 'open-uri'

def set_signal_handler
  trap(:INT) {
    exit 0;
  }
end

url = 'http://www.weekendfab.com/sinatrapp/'
puts "Type whatever key you want."
puts "Then, check the following URL."
puts url
puts "# type ctrl-c to exit."
puts

set_signal_handler

while key = STDIN.gets.chop
  if (/exit/ =~ key)
    break;
  end  
  result = open(url + key)
end

