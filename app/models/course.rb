class Course < ApplicationRecord
  has_many :evaluations
  has_many :students
  validates :anio, presence: true

end
