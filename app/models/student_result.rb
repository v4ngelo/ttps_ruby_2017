class StudentResult
  attr_accessor :student_name, :student_surname, :evaluation_name, :course_year, :evaluation_date, :evaluation_note

  def initialize(student_name, student_surname, evaluation_name, course_year, evaluation_date, evaluation_status)
    @student_name = student_name
    @student_surname = student_surname
    @evaluation_name = evaluation_name
    @course_year = course_year
    @evaluation_date = evaluation_date
    @evaluation_note = evaluation_status
  end

end