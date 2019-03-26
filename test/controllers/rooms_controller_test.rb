require 'test_helper'

class RoomsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @room = rooms(:roundtable)
  end

  test "should get new" do
    get new_room_url
    assert_response :success
  end

  test "should get edit" do
    get edit_room_url(@room.id)
    assert_response :success
  end

  test "should get show" do
    get room_url(@room.id)
    assert_response :success
  end

    

end
