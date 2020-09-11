#!/usr/bin/env ruby

# require 'student.rb'
require './file_handler'
# require './class_edit'

def edit_csv(csv)
  # puts csv[0]["email"]
  puts csv.find {|row| row["email"] == "labbemx@dion.ne.jp"}
end

read_file
