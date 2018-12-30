class Instructor < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true
  validates :education, presence: true
  validates :salary, numericality: {other_than: 0}
has_many :cohorts
end
