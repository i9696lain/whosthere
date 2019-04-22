class Room < ApplicationRecord
  has_secure_password
  has_many  :users
  has_many  :activities
  validates :name,     presence: true
  validates :password, presence: true,
                       length: { minimum: 8},
                       allow_nil: true
  attribute :url_token, :string, default: SecureRandom.hex(10)

  def to_param
    url_token
  end

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

end
