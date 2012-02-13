#!/usr/bin/ruby

def set_signal_handler
  trap(:INT) {
    exit 0;
  }
end

def usage
  puts "wrong arguments..."
  puts "ex) %reader filename"
end

set_signal_handler

unless ARGV[0] && FileTest.file?(ARGV[0])
  usage
  exit 1
end

File.open(ARGV[0], "r") { |file|
  loop do
    if file.gets
      print $_
    else
      sleep 1
    end
  end
}
