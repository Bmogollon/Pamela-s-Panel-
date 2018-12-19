class Instructor < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true
  validates :education, presence: true
  validates :salary, presence:true
belongs_to :cohort
end
