class EvaluationsResultReport
  attr_accessor :course_results, :student_results

  def initialize
    @student_results = Array.new
    @course_results = Array.new
  end

  def add_student_result(student_result)
    @student_results.push(student_result)
  end

  def add_course_evaluation_resume(evaluation_resume)
    @course_results.push(evaluation_resume)
  end

end