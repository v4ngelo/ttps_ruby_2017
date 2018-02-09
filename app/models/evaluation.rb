class Evaluation < ApplicationRecord
  belongs_to :course
  validates_associated :course
  validates :title, presence: true
  validates :evaluation_date, presence: true
  validates :evaluation_date, date: true
  validates :evaluation_date, date: { after: Proc.new { Date.today }, message: ' debe ser futura.'}
  validates :minimum_note, presence: true
  validates :minimum_note, numericality: { only_integer: true }

  after_create :createStudentEvaluations

  def createStudentEvaluations
    @students = Student.where(:course_id => course_id)
    @students.each do |student|
      EvaluationResult.create(:note => 0, :student_id => student.id, :evaluation_id => id)
    end
  end

end