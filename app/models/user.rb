class User < ApplicationRecord
  include ImageUploader[:avatar]

  belongs_to :room
  has_many  :activities
  validates :room_id, presence: true
  validates :name,    presence: true, length: { maximum: 50 },
                      uniqueness: { scope: [:room_id] }
  attribute :url_token, :string, default: SecureRandom.hex(10)

  def to_param
    url_token
  end

  def enter
    update_attribute(:is_staying, true)
  end

  def leave
    update_attribute(:is_staying, false)
  end

end
