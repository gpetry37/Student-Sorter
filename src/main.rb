#!/usr/bin/env ruby

# require 'student.rb'

# Reads in the csv file
def read_file
  puts "Enter csv file name to be read from 'data' folder:"
  file = gets

  filepath = File.expand_path("..", Dir.pwd)
  filepath += "/data/#{file}"

  valid_file = File.file?(filepath)
  file_check(valid_file)
end

# Checks whether or not a file is valid
def file_check(valid_file)
  until valid_file do
    puts "Invalid file. Please try again!"
    read_file
  end
end

read_file

