class EvaluationsReporter

  def initialize
    @report = EvaluationsResultReport.new
  end

  def report(course_id)
    if(course_id.nil?)
      return @report
    end
    evaluation_ids = Evaluation.ids_by_course_id(course_id)
    students = Student.joins(:course).where(course_id)
    student_results(students)
    course_results(evaluation_ids)
    @report.course_evaluations = Evaluation.by_evaluation_ids(evaluation_ids)
    return @report
  end

  private

  def course_results(evaluation_ids)
    evaluations = Evaluation.by_evaluation_ids(evaluation_ids)
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

  def student_results(students)
    unless students.empty?
      students.each do |student|
        evaluation_results_by_student = EvaluationResult.by_student_id_with_order(student.id, 'evaluations.evaluation_date')
        @report.add_course_evaluation_result(StudentResult.new(student.name,
                                                               student.surname,
                                                               evaluation_results_by_student))
      end
    end
  end

end