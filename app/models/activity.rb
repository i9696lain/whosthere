class Activity < ApplicationRecord
  belongs_to :room
  belongs_to :user
  validates :room_id, presence: true
  validates :user_id, presence: true
  validates :action,  numericality: { only_integer: true,
                                      greater_than_or_equal_to: 1,
                                      less_than_or_equal_to:    2 }
                                      # 1:enter 2:leave
  default_scope -> { order(created_at: :desc)}
end
