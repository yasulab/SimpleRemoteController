#!/usr/bin/ruby

def set_signal_handler
  trap(:INT) {
    exit 0;
  }
end

def usage
  puts "wrong arguments..."
  puts "ex) %write filename"
end

set_signal_handler

unless ARGV[0] && FileTest.file?(ARGV[0])
  usage
  exit 1
end

output = ""
#output = gets()
# write into file

while key = STDIN.gets.chop
  if (/exit/ =~ key)
    break;
  end
  output = "{\"date\":#{Time.now.to_i}, \"key\":\"#{key}\"}"
  STDOUT.puts "> #{output}"
  output_file = File.open(ARGV[0], "w")  
  output_file.write(output)
  output_file.close
end
