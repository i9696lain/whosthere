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
    log_in(@room)
    get edit_room_url(@room)
    assert_response :success
  end

  test "should get show" do
    log_in(@room)
    get room_url(@room)
    assert_response :success
  end

    

end
