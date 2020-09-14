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
  puts "Please enter the current email of the student you would like to modify."
  stu_email = gets.strip
  result = csv.find {|row| row["email"] == stu_email}
  if result == nil
    puts "Student email not found."
    q_modify(csv)
  else
    index = csv.find_index {|row| row["email"] == stu_email}
    puts "Student email found. Current data displayed below."
    puts csv.find {|row| row["email"] == stu_email}
    puts "Which of the following fields would you like to modify? Enter none to modify nothing."
    puts csv.headers
    field = gets.strip
    case field
    when "first_name"
      puts "Enter new student first name."
      edit_fname = gets.strip
      lname = csv[index]["last_name"]
      email = csv[index]["email"]
      section = csv[index]["section"]
      major1 = csv[index]["major1"]
      major2 = csv[index]["major2"]
      minor1 = csv[index]["minor1"]
      minor2 = csv[index]["minor2"]
      csv.delete(index)
      add_stu = Array[edit_fname, lname, email, section, major1, major2, minor1, minor2]
      csv << add_stu
      puts "Student modified!"
      q_modify(csv)
   when "last_name"
      puts "Enter new student last name."
      edit_lname = gets.strip
      fname = csv[index]["first_name"]
      email = csv[index]["email"]
      section = csv[index]["section"]
      major1 = csv[index]["major1"]
      major2 = csv[index]["major2"]
      minor1 = csv[index]["minor1"]
      minor2 = csv[index]["minor2"]
      csv.delete(index)
      add_stu = Array[fname, edit_lname, email, section, major1, major2, minor1, minor2]
      csv << add_stu
      puts "Student modified!"
      q_modify(csv)
   when "email"
      puts "Enter new student email."
      edit_email = gets.strip
      lname = csv[index]["last_name"]
      fname = csv[index]["first_name"]
      section = csv[index]["section"]
      major1 = csv[index]["major1"]
      major2 = csv[index]["major2"]
      minor1 = csv[index]["minor1"]
      minor2 = csv[index]["minor2"]
      csv.delete(index)
      add_stu = Array[fname, lname, edit_email, section, major1, major2, minor1, minor2]
      csv << add_stu
      puts "Student modified!"
      q_modify(csv)
   when "section"
      puts "Enter new student section."
      edit_section = gets.strip
      lname = csv[index]["last_name"]
      email = csv[index]["email"]
      fname = csv[index]["first_name"]
      major1 = csv[index]["major1"]
      major2 = csv[index]["major2"]
      minor1 = csv[index]["minor1"]
      minor2 = csv[index]["minor2"]
      csv.delete(index)
      add_stu = Array[fname, lname, email, edit_section, major1, major2, minor1, minor2]
      csv << add_stu
      puts "Student modified!"
      q_modify(csv)
   when "major1"
      puts "Enter new student 1st major."
      edit_major1 = gets.strip
      lname = csv[index]["last_name"]
      email = csv[index]["email"]
      section = csv[index]["section"]
      fname = csv[index]["first_name"]
      major2 = csv[index]["major2"]
      minor1 = csv[index]["minor1"]
      minor2 = csv[index]["minor2"]
      csv.delete(index)
      add_stu = Array[fname, lname, email, section, edit_major1, major2, minor1, minor2]
      csv << add_stu
      puts "Student modified!"
      q_modify(csv)
   when "major2"
      puts "Enter new student 2nd major."
      edit_major2 = gets.strip
      lname = csv[index]["last_name"]
      email = csv[index]["email"]
      section = csv[index]["section"]
      major1 = csv[index]["major1"]
      fname = csv[index]["first_name"]
      minor1 = csv[index]["minor1"]
      minor2 = csv[index]["minor2"]
      csv.delete(index)
      add_stu = Array[fname, lname, email, section, major1, edit_major2, minor1, minor2]
      csv << add_stu
      puts "Student modified!"
      q_modify(csv)
   when "minor1"
      puts "Enter new student 1st minor."
      edit_minor1 = gets.strip
      lname = csv[index]["last_name"]
      email = csv[index]["email"]
      section = csv[index]["section"]
      major1 = csv[index]["major1"]
      major2 = csv[index]["major2"]
      fname = csv[index]["first_name"]
      minor2 = csv[index]["minor2"]
      csv.delete(index)
      add_stu = Array[fname, lname, email, section, major1, major2, edit_minor1, minor2]
      csv << add_stu
      puts "Student modified!"
      q_modify(csv)
   when "minor2"
      puts "Enter new student 2nd minor."
      edit_minor2 = gets.strip
      lname = csv[index]["last_name"]
      email = csv[index]["email"]
      section = csv[index]["section"]
      major1 = csv[index]["major1"]
      major2 = csv[index]["major2"]
      minor1 = csv[index]["minor1"]
      fname = csv[index]["first_name"]
      csv.delete(index)
      add_stu = Array[fname, lname, email, section, major1, major2, minor1, edit_minor2]
      csv << add_stu
      puts "Student modified!"
      q_modify(csv)
    when "none"
      "Changed your mind? No problem!"
       q_modify(csv)
    else
      puts "Not a valid response. Please try again."
      edit_csv(csv)
    end
  end
end
