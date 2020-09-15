#!/usr/bin/env Ruby

# Gordon Petry
# Assignment 1

def list_groups(groups)
  i = 1
  groups.each do |array|
    puts "Group #{i}:"
    array.each do |student|
      print "\t#{student.fname} #{student.lname}: Section #{student.section}, Major(s): #{student.major1} #{student.major2}"
      if student.minor1.nil?
        puts ""
      else
        puts ", Minor(s): #{student.minor1} #{student.minor2}"
      end
    end
    i += 1
  end
  return groups
end

def write_to_file(groups)
  loop do
    puts "Would you like to write the groups to a file? (y/n)"
    ans = gets.strip
    if ans == "Y" or ans == "y"
      break
    elsif ans == "N" or ans == "n"
      puts "Will not write to file. Thank you!"
      return
    else
      puts "Invalid response. Please try again!"
    end
  end
  puts "Please enter a file name to write groups to."
  file_name = gets.strip
  filepath = File.expand_path("..", Dir.pwd)
  filepath += "/data/#{file_name}"
  file = File.new(filepath, "w")
  i = 1
  groups.each do |array|
    file << "Group #{i}:\n"
    array.each do |student|
      file << "\t#{student.fname} #{student.lname}: Section #{student.section}, Major(s): #{student.major1} #{student.major2}"
      if student.minor1.nil?
        file << "\n"
      else
        file << ", Minor(s): #{student.minor1} #{student.minor2}\n"
      end
    end
    i += 1
  end
  file.close
  puts "File has been written to data folder. Thank you!"
end 
