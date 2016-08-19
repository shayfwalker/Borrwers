class Lender < ApplicationRecord
  has_secure_password
  has_many :borrowers
  has_many :borrowing, through: :borrowers, source: :borrower
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, presence: true, uniquness {case_sensitive: false}, format:{with: EMAIL_REGEX}
  validates :first_name, :last_name, :money, presence: true	
  validates :password, presence: true

end
