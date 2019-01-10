class Course < ApplicationRecord
  validates :name, presence: true
  validates :hours, presence: true
  has_many :cohorts
  has_one_attached :avatar

end
