class Room < ApplicationRecord
  has_secure_password
  has_many  :users
  has_many  :activities
  validates :name,     presence: true
  validates :password, presence: true,
                       length: { minimum: 8},
                       allow_nil: true

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

end
