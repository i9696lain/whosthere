require 'test_helper'

class UserEnterLeaveTest < ActionDispatch::IntegrationTest

  def setup
    @room = rooms(:roundtable)
    @user = users(:gawain)
  end

  test "should be enter/leave" do
    get room_path(@room)
    assert_match  "0 people here.", response.body
    patch enter_room_user_path(@room.id,@user.id)
    follow_redirect!
    assert        @user.reload.is_staying
    assert_select 'input.is_staying', 1
    assert_match  "1 person here.", response.body
    patch leave_room_user_path(@room.id,@user.id)
    follow_redirect!
    assert_not    @user.reload.is_staying
    assert_match  "0 people here.", response.body
    assert_select 'input.not_staying', @room.users.count
  end

end
