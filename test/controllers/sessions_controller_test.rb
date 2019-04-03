require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @room = rooms(:roundtable)
  end

  test "should get login" do
    get room_login_url(@room)
    assert_response :success
  end

end
