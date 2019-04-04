class User < ApplicationRecord
  belongs_to :room
  has_many  :activities
  validates :room_id, presence: true
  validates :name,    presence: true, length: { maximum: 50 },
                      uniqueness: { scope: [:room_id] }

  def enter
    update_attribute(:is_staying, true)
  end

  def leave
    update_attribute(:is_staying, false)
  end

end
