#!/usr/bin/env ruby

# require 'student.rb'
require 'csv'

# Gets the input csv file
def get_file
  # Gets the file from the user
  puts "Enter csv file name to be read from 'data' folder:"
  file = gets.strip()

  # Builds out filepath
  filepath = File.expand_path("..", Dir.pwd)
  filepath += "/data/#{file}"

  # Error handling for input file
  valid_file = File.file?(filepath)
  file_check(valid_file)
end

# Checks whether or not a file is valid
def file_check(valid_file)
  unless valid_file
    puts "Invalid file. Please try again!"
    get_file
  end
end

get_file
