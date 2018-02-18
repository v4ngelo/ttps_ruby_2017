module EvaluationResultReportsHelper
  def full_name(result)
    result.student_name + " " + result.student_surname
  end

  def set_status(status, date)
   if date.future? then
     return "Sin evaluar"
   end
    return status
  end

end
