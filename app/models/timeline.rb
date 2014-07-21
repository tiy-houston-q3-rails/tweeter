class Timeline

  attr_reader :user

  def initialize(user)
    @user = user
  end

  def messages
    user.messages
  end
end
