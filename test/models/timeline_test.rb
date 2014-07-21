require 'test_helper'

class TimelineTest < ActiveSupport::TestCase

  def test_timeline_contains_my_tweeters
    me = User.create! username: "me", name: "Mini Me", email: "me@example.com", password: "memememe", password_confirmation: "memememe"
    message = Message.create!(user: me, body: "blah blah")

    timeline_messages = Timeline.new(me).messages
    assert_equal true, timeline_messages.include?(message)
  end

end
