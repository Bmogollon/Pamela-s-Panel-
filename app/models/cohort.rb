class Cohort < ApplicationRecord
  validates :name, :start_date, :end_date, presence: true
belongs_to :instructor
belongs_to :course
has_and_belongs_to_many :student
has_one_attached :avatar
end
