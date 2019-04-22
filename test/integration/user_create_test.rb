require 'test_helper'

class UserCreateTest < ActionDispatch::IntegrationTest

  def setup
    @room = rooms(:roundtable)
  end

  test "valid create user" do
    log_in(@room)
    get new_room_user_path(@room)
    assert_select "form[action=?]", room_users_path(@room)
    assert_difference 'User.count', 1 do
      post room_users_path(@room), params: { user: { name: "Example User" } }
    end
    follow_redirect!
    assert_template 'users/index'
  end

  test "invalid create user" do
    # 未ログイン
    get new_room_user_path(@room)
    assert_redirected_to room_login_path(@room)
    log_in(@room)
    get new_room_user_path(@room)
    assert_template 'users/new'
    # 無記名
    assert_no_difference 'User.count' do
      post room_users_path(@room), params: { user: { name: "" } }
    end
    # 同名
    post room_users_path(@room), params: { user: { name: "Example User" } }
    assert_no_difference 'User.count' do
      post room_users_path(@room), params: { user: { name: "Example User" } }
    end
  end
end
