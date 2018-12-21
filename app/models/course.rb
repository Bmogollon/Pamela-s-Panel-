class Course < ApplicationRecord
  validates :name, presence: true
  validates :hours, presence: true
  belongs_to :cohort, optional : true 
end
