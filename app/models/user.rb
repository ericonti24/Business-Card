class User < ApplicationRecord
  has_secure_password
  has_many :business_cards

  # validates :username, uniqueness: true, presence: true 
  # validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }

  # def self.create_by_google_omniauth(auth)
  #   self.find_or_create_by(username: auth[:info][:email]) do |u|
  #     u.password = SecureRandom.hex
  #   end
  # end
end
