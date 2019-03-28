require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @room = rooms(:roundtable)
    @otherroom = rooms(:seraph)
    @user = @room.users.build(name: "Tristan")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "room_id should be present" do
    @user.room_id = nil
    assert_not @user.valid?
  end

  #同一のルームでユーザ名は一意
  test "name should be unique in a room" do
    duplicate_user = @user.dup
    otherroom_user = @user.dup
    otherroom_user.room_id = @otherroom.id
    @user.save
    assert_not duplicate_user.valid?
    assert     otherroom_user.valid?
  end

  test "should success enter/leave" do
    assert_not @user.is_staying
    @user.enter
    assert     @user.reload.is_staying
    @user.leave
    assert_not @user.reload.is_staying
  end
end
