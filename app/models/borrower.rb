class Borrower < ApplicationRecord
  has_secure_password
  has_many :lenders
  has_many :borrowers_borrowing, through: :lenders, source: :lender
  validates :first_name, :last_name,:description, :need_money, :amount_needed, presence: true
  validates :password, presence: true
end
