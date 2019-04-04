require 'test_helper'

class UserUpdateTest < ActionDispatch::IntegrationTest

  def setup
    @user       = users(:gawain)
  end

  test "valid update user" do
    log_in(@user.room_id)
    get room_users_path(@user.room_id)
    assert_select "a[href=?]", edit_room_user_path(@user.room_id,@user.id)
    get edit_room_user_path(@user.room_id,@user.id)
    assert_select "form[action=?]", room_user_path(@user.room_id,@user.id)
    name = @user.name.upcase
    patch room_user_path(@user.room_id,@user), params: { user: { name: name }}
    assert_redirected_to room_users_path(@user.room_id)
    @user.reload
    assert_equal name, @user.name
  end

  test "redirect to login path with non-login user" do
    get edit_room_user_path(@user.room_id,@user.id)
    assert_redirected_to room_login_path(@user.room_id)
  end

end
