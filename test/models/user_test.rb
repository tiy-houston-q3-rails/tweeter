require 'test_helper'

class UserTest < ActiveSupport::TestCase


  def setup
    @user = User.new
  end

  def test_username_is_required
    @user.valid?
    assert_equal true, @user.errors[:username].any?
  end

  def test_name_is_required
    @user.valid?
    assert_equal true, @user.errors[:name].any?
  end

  def test_can_follow_another_user
    me = User.create! username: "me", name: "Mini Me", email: "me@example.com", password: "memememe", password_confirmation: "memememe"
    you = User.create! username: "you", name: "Mini You", email: "you@example.com", password: "memememe", password_confirmation: "memememe"
    me.follow!(you)
    assert_equal true, me.follow?(you)
  end

end
