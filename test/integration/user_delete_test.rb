require 'test_helper'

class UserDeleteTest < ActionDispatch::IntegrationTest

  def setup
    @user       = users(:gawain)
  end

  test "valid destroy user" do
    log_in(@user.room)
    get room_users_path(@user.room)
    assert_select "a[href=?]", room_user_path(@user.room,@user)
    assert_difference 'User.count', -1 do
      delete room_user_path(@user.room,@user)
    end
    assert_redirected_to room_users_path(@user.room)
  end

  test "invalid update user" do
    assert_no_difference 'User.count' do
      delete room_user_path(@user.room,@user)
    end
    assert_redirected_to room_login_path(@user.room)
  end

end
