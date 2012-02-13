#! /usr/local/bin/macruby
require "open-uri"
require "json"

framework "Cocoa"

$kCGHIDEventTap = 0
$kCGSessionEventTap = 1

def keyCodeFromChar(char)
  {
    "0" => 29,
    "1" => 18,
    "2" => 19,
    "3" => 20,
    "4" => 21,
    "5" => 23,
    "6" => 22,
    "7" => 26,
    "8" => 28,
    "9" => 25,
    "q" => 12,
    "w" => 13,
    "e" => 14,
    "r" => 15,
    "t" => 17,
    "y" => 16,
    "u" => 32,
    "i" => 34,
    "o" => 31,
    "p" => 35,
    "[" => 33,
    "]" => 30,
    "\\" => 42,
    "a" => 0,
    "s" => 1,
    "d" => 2,
    "f" => 3,
    "h" => 4,
    "g" => 5,
    "j" => 38,
    "k" => 40,
    "l" => 37,
    ";" => 41,
    "'" => 39,
    "z" => 6,
    "x" => 7,
    "c" => 8,
    "v" => 9,
    "b" => 11,
    "n" => 45,
    "m" => 46,
    "," => 43,
    "." => 47,
    "/" => 44,
    "left" => 123,
    "up" => 126,
    "right" => 124,
    "down" => 125,
  }[char]
end

def keyPress(char)
  keyCode = keyCodeFromChar(char) or return

  ev = CGEventCreateKeyboardEvent(nil, keyCode, true)
  CGEventPost $kCGSessionEventTap, ev
  CFRelease ev

  ev = CGEventCreateKeyboardEvent(nil, keyCode, false)
  CGEventPost $kCGSessionEventTap, ev
  CFRelease ev  
end

# test

url = "http://dl.dropbox.com/u/2819285/src/index.html"
prev_date = 0
while true
  open(url) {|f|
    input = JSON.parse(f.read)
    date = input["date"]
    if date != prev_date
      puts input
      keyPress input["key"]
      prev_date = date
    end
  }
  sleep 1
end
exit

# test data
# DATA.each{|line|
#   keyPress line.chomp
# }

__END__
h
l
l
o
left
left
left
e
right
right
right
,
w
o
r
l
d
