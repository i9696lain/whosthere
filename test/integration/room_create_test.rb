require 'test_helper'

class RoomCreateTest < ActionDispatch::IntegrationTest

  def setup
  end

  test "valid create room" do
    get new_room_path
    assert_select "form[action=?]", rooms_path
    assert_difference 'Room.count', 1 do
      post rooms_path, params: { room: { name: "Example room",
                                         password: "password",
                                         password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'rooms/show'
  end

  test "invalid create room" do
    get new_room_path
    assert_select "form[action=?]", rooms_path
    assert_no_difference 'Room.count', 1 do
      post rooms_path, params: { room: { name: "Example room",
                                         password: "password",
                                         password_confirmation: "pass" } }
    end
    assert_template 'rooms/new'
  end

end
