#!/usr/bin/env ruby

require './student'
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
    hash_creator(filepath)
    puts "Student hash has been created."
    return hash_creator(filepath)
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

# Takes CSV table and creates a Hash of arrays containing student objects for each section
def hash_creator(filepath)
  hash = Hash.new
  CSV.foreach(filepath, headers: true) do |row|
    student = Student.new(fname = row[0], lname = row[1], email = row[2], section = row[3], major1 = row[4], major2 = row[5], minor1 = row[6], minor2 = row[7])
    if hash.has_key?(student.section)
      array = hash[student.section]
      array.push(student)
      hash[student.section] = array
    else
      array = [student]
      hash[student.section] = array
    end
  end
  return hash
end
