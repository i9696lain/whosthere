require 'test_helper'

class RoomDeleteTest < ActionDispatch::IntegrationTest

  def setup
    @room = rooms(:roundtable)
  end

  test "valid destroy room" do
    log_in(@room)
    get edit_room_path(@room)
    assert_template 'rooms/edit'
    assert_select "a[data-method=?]", "delete"
    assert_difference 'Room.count', -1 do
      delete room_path(@room)
    end
    assert_redirected_to root_path
  end

  test "invalid destroy room" do
    assert_no_difference 'Room.count' do
      delete room_path(@room)
    end
    assert_redirected_to room_login_path(@room)
  end

end
