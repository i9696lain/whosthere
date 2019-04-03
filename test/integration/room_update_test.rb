require 'test_helper'

class RoomUpdateTest < ActionDispatch::IntegrationTest

  def setup
    @room = rooms(:roundtable)
  end

  test "valid update room" do
    log_in(@room)
    get edit_room_path(@room)
    name = "Round Table"
    patch room_path(@room), params: { room: { name: name,
                                              password: "",
                                              password_confirmation: "" } }
    assert_redirected_to @room
  end

  test "invalid update room" do
    log_in(@room)
    get edit_room_path(@room)
    patch room_path(@room), params: { room: { name: @room.name,
                                              password: "password",
                                              password_confirmation: "pass" } }
    assert_template 'rooms/edit'
  end  

end
