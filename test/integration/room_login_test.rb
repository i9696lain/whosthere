require 'test_helper'

class RoomLoginTest < ActionDispatch::IntegrationTest

  def setup
    @room = rooms(:roundtable)
  end

  test "login with invalid information" do
    get room_login_path(@room)
    assert_template 'sessions/new'
    post room_login_path, params: { session: { password: "" } }
    assert_template 'sessions/new'
    post room_login_path, params: { session: { password: "invalid" } }
    assert_template 'sessions/new'
  end

  test "login with valid information" do
    get room_login_path(@room)
    assert_template 'sessions/new'
    post room_login_path, params: { session: { password: "password" } }
    assert_redirected_to @room
    follow_redirect!
    assert_template 'rooms/show'
    assert_select "a[href=?]", room_users_path(@room)
  end

end
