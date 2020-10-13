#!/usr/bin/env ruby

# Gordon Petry
# Assignment 1

def constraints(csv)

  # Group number specification
  group_no = 0
  loop do 
    puts "How many students would you like to have in each group?"
    group_no = gets.to_i
    unless group_no == 0
      puts "You selected #{group_no} students per group."
      break
    else
      puts "Invalid response. Please try again."
    end
  end

  # Majors and Minors?
  mm_sel = 0
  loop do
    puts "Please enter the value of the option most relevant regarding majors and minors."
    puts "  1) Students with the same major should be grouped together."
    puts "  2) Students with different majors should be grouped together."
    puts "  3) Major does not matter for groups!"
    mm_sel = gets.to_i
    if mm_sel == 1
      puts "Okay, groups will be made prioritizing students with the same major."
      break
    elsif mm_sel == 2
      puts "Okay, groups will be made prioritizing students with different majors."
      break
    elsif mm_sel == 3
      puts "Okay, major and minor will not factor into group creation."
      break
    else
      puts "Invalid response. Please try again!"
    end
  end
  return build_group(csv, group_no, mm_sel)
end

# Builds out group structures based on the input provided
def build_group(csv, group_no, mm_sel)
  groups = Array.new
  case mm_sel
  # When similar majors are grouped together
  when 1
    csv.each do |_key, value|
      section = value.shuffle()
      until section.empty?
        group = [section.pop]
        searching = true
        i = 0
        section.each do |student| 
          if student.major2 == nil
            if student.major1 == group[0].major1 or student.major1 == group[0].major2 and searching
              group.push(section.delete_at(i))
            end
          else
            if student.major1 == group[0].major1 or student.major2 == group[0].major2 or student.major2 == group[0].major1 or student.major1 == group[0].major2 and searching
              group.push(section.delete_at(i))
            end
          end
          if group.length == group_no
            searching = false
          end
          i += 1
        end
        j = 1
        while j < group_no
          if group.length < group_no and !section.empty?
            group.push section.pop if !section[0].nil?
          end
          j += 1
        end
        groups.push group
      end
    end
  # When different majors are grouped together
  when 2
    csv.each do |_key, value|
      section = value.shuffle()
      until section.empty?
        group = [section.pop]
        searching = true
        i = 0
        section.each do |student|
          if student.major2 == nil
            if student.major1 != group[0].major1 or (student.major1 != group[0].major2 and group[0].major2 != nil) and searching
              group.push(section.delete_at(i))
            end
          else
            if student.major1 != group[0].major1 or student.major2 != group[0].major2 or student.major2 != group[0].major1 or student.major1 != group[0].major2 and searching
              group.push(section.delete_at(i))
            end
          end
          if group.length == group_no
            searching = false
          end
          i += 1
        end
        j = 1
        while j < group_no
          if group.length < group_no and !section.empty?
            group.push section.pop if !section[0].nil?
          end
          j += 1
        end
        groups.push group
      end
    end
  # When majors do not matter for grouping
  when 3
    csv.each do |_key, value|
      section = value.shuffle()
      section.each_slice(group_no).to_a.each do |group|
        groups.push group
      end
    end
  end
  return groups
end
