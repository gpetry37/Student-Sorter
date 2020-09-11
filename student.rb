class Student
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
