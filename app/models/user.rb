class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  validates :email_address, presence: true, if: Proc.new { |user| user.approved? }
  # normalizes :email_address, with: ->(e) { e.strip.downcase }
end
