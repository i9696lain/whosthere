class User < ApplicationRecord
  belongs_to :room
  validates :room_id, presence: true
  validates :name,    presence: true, length: { maximum: 50 },
                      uniqueness: { scope: [:room_id] }

end
