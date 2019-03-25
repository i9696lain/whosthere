class Room < ApplicationRecord
  has_secure_password
  validates :name,     presence: true
  validates :password, presence: true,
                       length: { minimum: 8},
                       allow_nil: true
end
