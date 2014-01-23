#!/usr/bin/env ruby
# ruby_intro
# Basic file I/O and command-line arguments.
# www.tutorialspoint.com/ruby/ruby_input_output.htm
# http://ruby.about.com/od/rubyfeatures/a/argv.htm
# run it like: ./ruby_intro.rb filename

ARGV.each do |file|
    puts "Creating file: #{file}."
    descriptor = File.new(file, "w+")
    descriptor.syswrite("This is the content of file #{file}")
    # Close it for no reason, then read from it with IO.
    IO.foreach(file) { |line| puts line }
end
