#!/usr/bin/env ruby

# Gordon Petry
# Assignment 1

# Decision tree for deciding what information to modify, if any
def q_modify(csv)
  loop do
    puts "Would you like to view or modify information in the current table? (y/n)"
    edit = gets.strip

    if edit == "Y" or edit == "y"
      puts "Would you like to add a new student, remove a student, edit an existing student or view the current table? (a/r/e/v)"
      action = gets.strip
      if action == "A" or action == "a"
        csv = add_csv(csv)
      elsif action == "R" or action == "r"
        csv = del_csv(csv)
      elsif action == "E" or action == "e"
        csv = edit_csv(csv)
      elsif action == "V" or action == "v"
        print_csv(csv)
      else
        puts "Not a valid response! Please try again."
      end
    elsif edit == "N" or edit == "n"
      puts "Moving on to group creation."
      return csv
    else
      puts "Not a valid response! Please try again."
    end
  end
end

# Decision Trees for adding students to CSV Table
def add_csv(csv)
  loop do
    puts "Adding a new student!"
    puts "Please enter the email of the student to be added."
    add_email = gets.strip
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
    m4 = true
    add_minor2 = gets.strip
    if add_minor2 == ""
      add_minor2 = nil
    end

    # Checks that required fields have been entered and adds student to section hash array
    unless add_fname == "" or add_lname == "" or add_email == "" or add_section == "" or add_major1 == ""
      student = Student.new(fname = add_fname, lname = add_lname, email = add_email, section = add_section, major1 = add_major1, major2 = add_major2, minor1 = add_minor1, minor2 = add_minor2)
      if csv.has_key?(student.section)
        array = csv[student.section]
        array.push(student)
        csv[student.section] = array
      else
        array = [student]
        csv[student.section] = array
      end
      puts "Student added!"
      return csv
    else
      puts "A required field was left blank! Ensure only specified fields are left blank."
    end
  end
end

# Decision trees for deleting a student
def del_csv(csv)
  stu_section = ""
  print_csv(csv)
  loop do
    puts "Please enter the section that the student to be modified is currently in."
    stu_section = gets.strip
    if csv.has_key?(stu_section)
      break
    else
      puts "Section number not found. Please try again."
    end
  end
  
  arr = csv[stu_section]
  index = 0
  found = false
  loop do
    puts "Please enter the current email of the student you would like to modify."
    stu_email = gets.strip
    for student in arr
      if student.email == stu_email
        found = true
        break
      end
      index += 1
    end
    if found == false
      puts "Student email not found. Please try again."
    else
      break
    end
  end

  loop do
    puts "Student found. Student information is displayed below."
    puts "first_name: #{arr[index].fname}, last_name: #{arr[index].lname}, email: #{arr[index].email}, section: #{arr[index].section}, major1: #{arr[index].major1}, major2: #{arr[index].major2}, minor1: #{arr[index].minor1}, minor2: #{arr[index].minor2}"
    puts "Are you sure you would like to remove this student? (y/n)"
    del_stu = gets.strip
    if del_stu == "Y" or del_stu == "y"
      arr.delete_at(index)
      csv[stu_section] = arr
      puts "Student was removed."
      return csv
    elsif del_stu == "N" or del_stu == "n"
      puts "Student was not removed."
      return csv
    else
      puts "Not a valid response! Please try again."
    end
  end
end

# Decision trees for editing current students
def edit_csv(csv)
  stu_section = ""
  print_csv(csv)
  loop do
    puts "Please enter the section that the student to be modified is currently in."
    stu_section = gets.strip
    if csv.has_key?(stu_section)
      break
    else
      puts "Section number not found. Please try again."
    end
  end
  
  arr = csv[stu_section]
  index = 0
  found = false
  loop do
    puts "Please enter the current email of the student you would like to modify."
    stu_email = gets.strip
    for student in arr
      if student.email == stu_email
        found = true
        break
      end
      index += 1
    end
    if found == false
      puts "Student email not found. Please try again."
    else
      break
    end
  end
  puts "Student email found. Current data displayed below."
  loop do
    puts "first_name: #{arr[index].fname}, last_name: #{arr[index].lname}, email: #{arr[index].email}, section: #{arr[index].section}, major1: #{arr[index].major1}, major2: #{arr[index].major2}, minor1: #{arr[index].minor1}, minor2: #{arr[index].minor2}"
    puts "Which of the above fields would you like to modify? Enter 'none' to modify nothing."
    field = gets.strip
    case field
    when "first_name"
      puts "Enter new student first name."
      edit_fname = gets.strip
      arr[index].fname = edit_fname
      csv[stu_section] = arr
      puts "Student modified!"
      return csv
    when "last_name"
      puts "Enter new student last name."
      edit_lname = gets.strip
      arr[index].lname = edit_lname
      csv[stu_section] = arr
      puts "Student modified!"
      return csv
    when "email"
      puts "Enter new student email."
      edit_email = gets.strip
      arr[index].email = edit_email
      csv[stu_section] = arr
      puts "Student modified!"
      return csv
    when "section"
      puts "Enter new student section."
      edit_section = gets.strip
      arr[index].section = edit_section
      if csv.has_key?(edit_section)
        array = csv[edit_section]
        array.push(arr[index])
        csv[edit_section] = array
      else
        csv[edit_section] = arr[index]
      end
      arr.delete_at(index)
      puts "Student modified!"
      return csv
    when "major1"
      puts "Enter new student 1st major."
      edit_major1 = gets.strip
      arr[index].major1 = edit_major1
      csv[stu_section] = arr
      puts "Student modified!"
      return csv
    when "major2"
      puts "Enter new student 2nd major."
      edit_major2 = gets.strip
      arr[index].major2 = edit_major2
      csv[stu_section] = arr
      puts "Student modified!"
      return csv
    when "minor1"
      puts "Enter new student 1st minor."
      edit_minor1 = gets.strip
      csv[stu_section] = arr
      arr[index].minor1 = edit_minor1
      puts "Student modified!"
      return csv
    when "minor2"
      puts "Enter new student 2nd minor."
      edit_minor2 = gets.strip
      arr[index].minor2 = edit_minor2
      csv[stu_section] = arr
      puts "Student modified!"
      return csv
    when "none"
      "Changed your mind? No problem!"
      return csv
    else
      puts "Not a valid response. Please try again."
    end
  end
end

# Creates a printout of the csv for viewing
def print_csv(csv)
  csv.each do |_key, value|
    value.each do |student|
      print "\t#{student.fname} #{student.lname} - Email: #{student.email}, Section #{student.section}, Major(s): #{student.major1} #{student.major2}"
      if student.minor1.nil?
        puts ""
      else
        puts ", Minor(s): #{student.minor1} #{student.minor2}"
      end
    end
  end
  puts ""
end