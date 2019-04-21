require 'test_helper'

class UserEnterLeaveTest < ActionDispatch::IntegrationTest

  def setup
    @room = rooms(:roundtable)
    @user = users(:gawain)
  end

  test "should be enter/leave" do
    log_in(@user.room_id)
    get room_path(@room)
    assert_match  "0 people here.", response.body

    # enter
    assert_difference '@room.activities.where(action:1).count', 1 do
      patch enter_room_user_path(@room.id,@user.id)
    end
    follow_redirect!
    assert        @user.reload.is_staying
    assert_select 'input.not_staying', @room.users.count - 1
    assert_match  "1 person here.", response.body

    # leave
    # assert_difference 'Activity.count', 1 do
    assert_difference '@room.activities.where(action:2).count', 1 do
      patch leave_room_user_path(@room.id,@user.id)
    end
    follow_redirect!
    assert_not    @user.reload.is_staying
    assert_match  "0 people here.", response.body
    assert_select 'input.not_staying', @room.users.count
  end

end
