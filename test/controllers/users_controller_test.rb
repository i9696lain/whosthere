require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @room = rooms(:roundtable)
    @user = users(:gawain)
  end

  test "should get index" do
    get room_users_url(@room.id)
    assert_response :success
  end

  test "should get new" do
    get new_room_user_url(@room.id)
    assert_response :success
  end

  test "should get edit" do
    get edit_room_user_url(@room.id,@user.id)
    assert_response :success
  end

end
