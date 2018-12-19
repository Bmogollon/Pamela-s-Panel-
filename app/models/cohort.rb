class Cohort < ApplicationRecord
  validates :name, :start_date, :end_date, presence: true
has_many :students
end
