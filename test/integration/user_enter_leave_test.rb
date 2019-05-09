require 'test_helper'

class UserEnterLeaveTest < ActionDispatch::IntegrationTest

  def setup
    @room = rooms(:roundtable)
    @user = users(:gawain)
  end

  test "should be enter/leave" do
    log_in(@user.room)
    get room_path(@room)

    # enter
    assert_difference '@room.activities.where(action:1).count', 1 do
      patch enter_room_user_path(@room,@user)
    end
    follow_redirect!
    assert        @user.reload.is_staying
    assert_select 'input.not_staying', @room.users.count - 1

    # leave
    assert_difference '@room.activities.where(action:2).count', 1 do
      patch leave_room_user_path(@room,@user)
    end
    follow_redirect!
    assert_not    @user.reload.is_staying
    assert_select 'input.not_staying', @room.users.count
  end

end
