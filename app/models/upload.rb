class Upload < ApplicationRecord
  has_one_attached :file
  has_one :user
end
