class Student < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, inclusion: {in: 1..150, :message => "needs to be greater than 1 and less than 150"}
  validates :education, presence: true
  has_one_attached :avatar
  has_and_belongs_to_many :cohorts, optional: true
end
