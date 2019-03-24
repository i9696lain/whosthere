require 'test_helper'

class RoomTest < ActiveSupport::TestCase

  def setup
    @room = Room.new(name: "RoundTable", password: "password", 
                     password_confirmation: "password")
  end

  test "should be valid" do
    assert @room.valid?
  end

  test "name should be present" do
    @room.name = "     "
    assert_not @room.valid?
  end

  test "password should be present (nonblank)" do
    @room.password = @room.password_confirmation = " " * 8
    assert_not @room.valid?
  end

  test "password should have a minimum length" do
    @room.password = @room.password_confirmation = "a" * 7
    assert_not @room.valid?
  end

end
