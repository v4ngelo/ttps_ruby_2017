class Student < ApplicationRecord
  belongs_to :course
  validates_associated :course
  validates :name, presence: true
  validates :surname, presence: true
  validates :dni, presence: true
  validates :student_number, presence: true
  validates :email, presence: true
  validates :email, :email_format => { :message => ', por favor ingrese un email correcto.' }

  after_create :createStudentEvaluations

  def createStudentEvaluations
    @evaluations = Evaluation.where(:course_id => course_id)
    @evaluations.each do |eval|
      EvaluationResult.create(:note => 0, :student_id => id, :evaluation_id => eval.id)
    end
  end
end
