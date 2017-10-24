require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:daichi)
  end

  test "name should be valid" do
    @user.name = nil
    assert_not @user.valid?
  end
end
