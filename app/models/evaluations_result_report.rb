class EvaluationsResultReport
  attr_accessor :course_results, :course_evaluations_results, :course_evaluations

  def initialize
    @course_evaluations_results = Array.new
    @course_results = Array.new
  end

  def add_course_evaluation_resume(evaluation_resume)
    @course_results.push(evaluation_resume)
  end

  def add_course_evaluation_result(student_result)
    @course_evaluations_results.push(student_result)
  end

end