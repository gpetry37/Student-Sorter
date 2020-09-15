#!/usr/bin/env ruby

# Class to hold student data
class Student
  attr_accessor :fname
  attr_accessor :lname
  attr_accessor :email
  attr_accessor :section
  attr_accessor :major1
  attr_accessor :major2
  attr_accessor :minor1
  attr_accessor :minor2

  def initialize(fname, lname, email, section, major1, major2=nil, minor1=nil, minor2=nil)
    @fname = fname
    @lname = lname
    @email = email
    @section = section
    @major1 = major1
    @major2 = major2
    @minor1 = minor1
    @minor2 = minor2
  end

  
end
