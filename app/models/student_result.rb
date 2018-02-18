class StudentResult
  attr_accessor :student_name, :student_surname, :evaluation_results

  def initialize(student_name, student_surname, evaluation_results)
    @student_name = student_name
    @student_surname = student_surname
    @evaluation_results = evaluation_results
  end

end