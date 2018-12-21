class Cohort < ApplicationRecord
  validates :name, :start_date, :end_date, presence: true
has_many :studentshas_one :instructor
has_one :course
has_and_belongs_to_many :student
end
,
