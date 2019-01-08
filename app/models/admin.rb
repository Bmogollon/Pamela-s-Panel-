class Admin < ApplicationRecord
  validates :name,  presence: true, length: { maximum: 10 }
  validates :email, presence: true, length: { maximum: 30 }
  validates :password, presence:true

  has_secure_password
end
