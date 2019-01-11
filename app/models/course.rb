class Course < ApplicationRecord
  validates :name, presence: true
  validates :hours , numericality: { greater_than: 0 }
  has_many :cohorts
  has_one_attached :avatar

end
