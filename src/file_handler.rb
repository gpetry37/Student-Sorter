#!/usr/bin/env ruby

require 'csv'

# Gets the input csv file
def read_file
  # Gets the file from the user
  puts "Enter csv file name to be read from 'data' folder:"
  file = gets.strip()

  # Builds out filepath
  filepath = File.expand_path("..", Dir.pwd)
  filepath += "/data/#{file}"

  # Error handling for input file
  valid_file = File.file?(filepath)
  valid_csv = filepath.include? ".csv"

  # Create CSV Table from file
  if file_check(valid_file, valid_csv)
    csv = CSV.parse(File.read(filepath), headers: true)
    edit_csv(csv)
  end
end

# Checks whether or not a file is valid and a csv file
def file_check(valid_file, valid_csv)
  if valid_file
    if valid_csv
      return true
    else
      puts "Not a csv file. Please try again!"
      read_file
    end
  else
    puts "Invalid file. Please try again!"
    read_file
  end
end

