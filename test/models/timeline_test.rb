require 'test_helper'

class TimelineTest < ActiveSupport::TestCase

  def test_timeline_contains_my_tweeters
    me = create_user("me")
    message = Message.create!(user: me, body: "blah blah")

    timeline_messages = Timeline.new(me).messages
    assert_equal true, timeline_messages.include?(message)
  end

  def test_timeline_contains_people_i_follow
    me = create_user("me")
    you = create_user("you")
    me.follow!(you)
    message = Message.create!(user: you, body: "blah blah")

    timeline_messages = Timeline.new(me).messages
    assert_equal true, timeline_messages.include?(message)
  end

  def test_timeline_does_not_contains_people_i_do_not_follow
    me = create_user("me")
    you = create_user("you")

    message = Message.create!(user: you, body: "blah blah")

    timeline_messages = Timeline.new(me).messages
    assert_equal false, timeline_messages.include?(message)
  end


end
