#!/usr/bin/env ruby

require 'csv'

def q_modify(csv)
  puts "Would you like to modify information in the current table? (y/n)"
  edit = gets.strip

  if edit == "Y" or edit == "y"
    puts "Would you like to add a new student, remove a student or edit an existing student? (a/d/e)"
    action = gets.strip
    if action == "A" or action == "a"
      add_csv(csv)
    elsif action == "D" or action == "d"
      del_csv(csv)
    elsif action == "E" or action == "e"
      edit_csv(csv)
    else
      puts "Not a valid response! Please try again."
      q_modify(csv)
    end
  elsif edit == "N" or edit == "n"
    puts "No modifications will be made."
  else
    puts "Not a valid response! Please try again."
    q_modify(csv)
  end
end

def add_csv(csv)
  puts "Adding a new student!"
  
end

def del_csv(csv)
  puts "Please enter the email of the student to be removed."
  del_email = gets.strip
  result = csv.find {|row| row["email"] == "del_email"}
  if result == nil
    puts "Student email not found. Please try again."
    del_csv(csv)
  else
    puts result
    puts "Are you sure you would like to remove this student? (y/n)"
    del_stu = gets.strip
    if del_stu == "Y" or del_stu == "y"
      csv.delete(csv.find_index {|row| row["email"] == result})
      puts "Student was removed."
      q_modify(csv)
    elsif del_stu == "N" or del_stu == "n"
      puts "Student was not removed."
      q_modify(csv)
    else
      puts "Not a valid response! Please try again."
      q_modify(csv)
    end
  end
end

def edit_csv(csv)
  puts csv.headers
  puts csv.find {|row| row["email"] == "laddemx@dion.ne.jp"}
end
