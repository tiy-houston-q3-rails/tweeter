class Search

  def messages(query_string)
    Message
      .joins(:user)
      .where("body ILIKE ? OR users.username ILIKE ?", "%#{query_string.strip}%", "%#{query_string.strip}%")
  end
end
