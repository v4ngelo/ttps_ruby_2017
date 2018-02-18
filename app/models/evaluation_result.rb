class EvaluationResult < ApplicationRecord
  belongs_to :student
  belongs_to :evaluation
  validates_associated :evaluation
  validates_associated :student
  validates :note, presence: true
  validates :note, numericality: { only_integer: true }, :allow_nil => true

  before_create :setEvaluationStatus
  before_update :setEvaluationStatus

  APPROVED = "Aprobado"
  DISAPPROVED = "Desaprobado"
  ABSENT = "Ausente"

  def self.by_evaluation_ids_with_order(evaluation_ids, order)
    EvaluationResult.includes(:evaluation).where(:evaluation_id => evaluation_ids).order(order)
  end

  def self.by_student_id_with_order(student_id, order)
    EvaluationResult.includes(:evaluation).where(:student_id => student_id).order(order)
  end

  def setEvaluationStatus
    if note == 0
      self.status = ABSENT
    else if note < evaluation.minimum_note
           self.status = DISAPPROVED
         else
           self.status = APPROVED
         end
    end
  end

end
