require 'test_helper'

class SearchTest < ActiveSupport::TestCase

  def test_search_for_username
    user = create_user("bro")
    Message.create!(user: user, body: "search for me")

    search = Search.new
    thing = search.messages('bro')

    # did thing return what I wanted

    is_found = thing.map(&:body).include?("search for me")

    assert_equal true, is_found
  end

  def test_search_finds_it

    user = create_user("bro")
    Message.create!(user: user, body: "search for me")

    query_string = "search for me"
    search = Search.new
    thing = search.messages(query_string)

    # did thing return what I wanted

    is_found = thing.map(&:body).include?(query_string)

    assert_equal true, is_found

  end

  def test_search_does_not_finds_it

    user = create_user("bro")
    Message.create!(user: user, body: "search for me")
    Message.create!(user: user, body: "don't cry for me angentina")

    search = Search.new
    thing = search.messages("search for me")

    # did thing return what I wanted

    is_found = thing.map(&:body).include?("don't cry for me angentina")

    assert_equal false, is_found


  end

end
