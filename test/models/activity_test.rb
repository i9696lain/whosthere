require 'test_helper'

class ActivityTest < ActiveSupport::TestCase

  def setup
    @user = users(:gawain)
    @activity = @user.activities.build(room_id: @user.room_id, action: 1)
  end

  test "should be valid" do
    @activity.action = 1
    assert @user.valid?
    @activity.action = 2
    assert @user.valid?
  end

  test "action should be in the defined range of numbers" do
    @activity.action = 0
    assert_not @user.valid?
    @activity.action = 3
    assert_not @user.valid?
  end

  test "room_id should be present" do
    @activity.room_id = nil
    assert_not @user.valid?
  end

  test "user_id should be present" do
    @activity.user_id = nil
    assert_not @user.valid?
  end

end
