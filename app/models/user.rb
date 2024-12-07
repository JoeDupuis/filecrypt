class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :uploads
  has_many :api_keys, as: :bearer

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
