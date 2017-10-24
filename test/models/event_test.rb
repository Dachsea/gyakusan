require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def setup
    @event = events(:one)
    @user = users(:daichi)
  end

  test "content should be valid" do
    @event.content = nil
    assert_not @event.valid?
  end

  test "dead should be valid" do
    @event.dead = nil
    assert_not @event.valid?
  end

  test "user id should be valid" do
    @event.user_id = nil
    assert_not @event.valid?
  end
end
