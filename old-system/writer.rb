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

while line = STDIN.gets
  if (/exit/ =~ line)
    break;
  end
  STDOUT.puts "> #{line}"
  output_file = File.open(ARGV[0], "a")  
  output_file.write(line)
  output_file.close
end
