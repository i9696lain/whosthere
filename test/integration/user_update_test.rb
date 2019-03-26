require 'test_helper'

class UserUpdateTest < ActionDispatch::IntegrationTest

  def setup
    @user       = users(:gawain)
  end

  test "should redirect and success update" do
    get room_users_path(@user.room_id)
    assert_select "a[href=?]", edit_room_user_path(@user.room_id,@user.id)
    get edit_room_user_path(@user.room_id,@user.id)
    name = @user.name.upcase 
    patch room_user_path(@user.room_id,@user), params: { user: { name: name }}
    assert_redirected_to room_users_path(@user.room_id)
    @user.reload
    assert_equal name, @user.name
  end

end
