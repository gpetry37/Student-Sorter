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
  puts "Please enter the email of the student to be added."
  add_email = gets.strip
  result = csv.find {|row| row["email"] == add_email}
  unless result == nil
    puts "Student email already exists."
    q_modify(csv)
  else
    puts "Please enter the first name of the student to be added."
    add_fname = gets.strip
    puts "Please enter the last name of the student to be added."
    add_lname = gets.strip
    puts "Please enter the class section of the student to be added."
    add_section = gets.strip
    puts "Please enter the first major of the student to be added."
    add_major1 = gets.strip
    puts "Please enter the second major of the student to be added. If none, hit enter."
    add_major2 = gets.strip
    if add_major2 == ""
      add_major2 = nil
    end
    puts "Please enter the first minor of the student to be added. If none, hit enter."
    add_minor1 = gets.strip
    if add_minor1 == ""
      add_minor1 = nil
    end
    puts "Please enter the second minor of the student to be added. If none, hit enter."
    add_minor2 = gets.strip
    if add_minor2 == ""
      add_minor2 = nil
    end

    unless add_fname == "" or add_lname == "" or add_email == "" or add_section == "" or add_major1 == ""
      headers = Array["first_name", "last_name", "email", "section", "major1", "major2", "minor1", "minor2"]
      add_stu = Array[add_fname, add_lname, add_email, add_section, add_major1, add_major2, add_minor1, add_minor2]
      csv << add_stu
      puts "Student added!"
      q_modify(csv)
    else
      puts "A required field was left blank! Ensure only specified fields are left blank."
      add_csv(csv)
    end
  end
end

def del_csv(csv)
  puts "Please enter the email of the student to be removed."
  del_email = gets.strip
  result = csv.find {|row| row["email"] == del_email}
  if result == nil
    puts "Student email not found. Please try again."
    del_csv(csv)
  else
    puts "Are you sure you would like to remove this student? (y/n)"
    del_stu = gets.strip
    if del_stu == "Y" or del_stu == "y"
      csv.delete(csv.find_index {|row| row["email"] == del_email})
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
