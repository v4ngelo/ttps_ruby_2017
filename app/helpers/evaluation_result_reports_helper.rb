module EvaluationResultReportsHelper
  def full_name(result)
    result.student_name + " " + result.student_surname
  end
end
