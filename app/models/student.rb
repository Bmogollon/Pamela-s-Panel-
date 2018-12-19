class Student < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true
  validates :education, presence: true
belongs_to :cohort
end
