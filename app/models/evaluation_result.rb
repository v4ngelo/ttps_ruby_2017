class EvaluationResult < ApplicationRecord
  belongs_to :student
  belongs_to :evaluation
  validates_associated :evaluation
  validates_associated :student
  validates :note, presence: true
  validates :note, numericality: { only_integer: true }

  before_create :setEvaluationStatus
  before_update :setEvaluationStatus



  APPROVED = "Aprobado"
  DISAPPROVED = "Desaprobado"
  ABSENT = "Ausente"

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
