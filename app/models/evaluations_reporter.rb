class EvaluationsReporter

  def initialize
    @report = EvaluationsResultReport.new
  end

  def report(course_id)
    if(course_id.nil?)
      return @report
    end
    evaluation_ids = get_evaluations_four_course(course_id)
    student_results(evaluation_ids)
    course_results(evaluation_ids)
    return @report
  end

  private

  def course_results(evaluation_ids)
    evaluations = Evaluation.joins(:course).where('evaluations.id' => evaluation_ids)
    unless evaluations.empty?
      evaluations.each do |eval|
        evaluations_results = EvaluationResult.joins(:evaluation).where(:evaluation_id => eval.id).pluck(:status)
        absent_students = evaluations_results.select{|e| e == EvaluationResult::ABSENT}
        approved_students = evaluations_results.select{|e| e == EvaluationResult::APPROVED}
        disapproved_students = evaluations_results.select{|e| e == EvaluationResult::DISAPPROVED}
        @report.add_course_evaluation_resume(CourseResults.new(eval.title,
                                                               approved_students.size,
                                                               disapproved_students.size,
                                                               absent_students.size))
      end
    end
  end

  def student_results(evaluation_ids)
    evaluation_results = EvaluationResult.includes(:evaluation).where(:evaluation_id => evaluation_ids).order('evaluations.evaluation_date')
    unless evaluation_results.empty?
      evaluation_results.each do |result|
        @report.add_student_result(StudentResult.new(result.student.name,
                                                     result.evaluation.title,
                                                     result.evaluation.course.anio,
                                                     result.evaluation.evaluation_date,
                                                     result.status))
      end
    end
  end

  def get_evaluations_four_course(course_id)
    Evaluation.where(course_id).pluck(:id)
  end

end