require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @event = events(:one)
    @user = users(:daichi)
  end

  test "redirect root create not logged in" do
    get root_path
    assert_no_difference 'Event.count' do
      post events_path, params: {event: {content: "OK", dead: "2017-10-07", user_id: @user.id}}
    end
    assert_redirected_to new_user_session_path
  end

  test "user can create only when logged in" do
    sign_in(@user)
    get root_path
    assert_difference 'Event.count', 1 do
      post events_path, params: {event: {content: @event.content, dead: @event.dead, user_id: @user.id}}
    end
    assert_redirected_to root_url
  end

  test "index should not include other users event" do
    sign_in(@user)
    get root_path
    assert_template 'events/index'
    assert_match "First", response.body
    assert_no_match "Other", response.body
  end

end