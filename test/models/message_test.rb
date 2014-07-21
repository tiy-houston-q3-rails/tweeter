require 'test_helper'

class MessageTest < ActiveSupport::TestCase

  def test_user_is_required
    message = Message.new
    message.save
    assert_equal true, message.errors[:user].any?
  end

  def test_body_is_required
    message = Message.new
    message.save
    assert_equal true, message.errors[:body].any?
  end

  def test_body_cannot_be_over_140
    message = Message.new body: "A"*141
    message.valid?
    assert_equal true, message.errors[:body].any?
  end

  def test_body_can_be_less_than_140
    (1..140).each do |length|
      message = Message.new body: "A"*length
      message.valid?
      assert_equal false, message.errors[:body].any?
    end
  end
end
