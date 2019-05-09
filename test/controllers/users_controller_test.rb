require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @room = rooms(:roundtable)
    @user = users(:gawain)
  end

  test "should get index" do
    log_in(@room)
    get room_users_url(@room)
    assert_response :success
  end

  test "should get new" do
    log_in(@room)
    get new_room_user_url(@room)
    assert_response :success
  end

  test "should get edit" do
    log_in(@room)
    get edit_room_user_url(@room,@user)
    assert_response :success
  end

end
