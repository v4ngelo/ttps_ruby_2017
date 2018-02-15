class Course < ApplicationRecord
  has_many :evaluations, dependent: :restrict_with_error
  has_many :students, dependent: :restrict_with_error
  validates :anio, presence: true

end
