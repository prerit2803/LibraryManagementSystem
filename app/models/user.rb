class User < ApplicationRecord
  before_save { self.email = email.downcase }

  has_many :bookings, dependent: :destroy

  validates :full_name,  presence: true, length: { maximum: 40 }

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: { case_sensitive: false }, presence: true, length: { maximum: 100 }, format: { with: email_regex }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }


  def self.authenticate(email, submitted_password)
    user = find_by_email(email)

    return nil if user.nil?
    return user if user.password == submitted_password
  end
end
