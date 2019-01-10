class Instructor < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, inclusion: {in: 1..150, :message => "needs to be greater than 1 and less than 150"}
  validates :education, presence: true
  validates :salary, numericality: {other_than: 0}
has_many :cohorts
has_one_attached :avatar

end
