require 'test_helper'

class FollowerTest < ActiveSupport::TestCase

  def test_user_is_required
    follower = Follower.new
    follower.valid?
    assert_equal true, follower.errors[:user].any?
  end

  def test_them_is_required
    follower = Follower.new
    follower.valid?
    assert_equal true, follower.errors[:them_id].any?
  end


end
