class Student < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true
  validates :education, presence: true
  has_and_belongs_to_many :cohorts, optional: true
end
