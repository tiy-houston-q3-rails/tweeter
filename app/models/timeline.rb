class Timeline

  attr_reader :user

  def initialize(user)
    @user = user
  end

  def messages
    Message.where(user_id: all_user_ids).order("created_at DESC")
  end

  private

  def all_user_ids
    [@user.id] + their_ids
  end

  def their_ids
    @user.followers.pluck(:them_id)
  end
end
