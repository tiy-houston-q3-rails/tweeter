require 'test_helper'

class TimelineControllerTest < ActionController::TestCase

  include Devise::TestHelpers

  def test_should_make_sign_in
    get :show
    assert_response :redirect
  end

  def test_view_assigns_messages
    sign_in :user, create_user("you")
    get :show
    assert_response :success
    assert_not_nil assigns(:messages)
  end

  def test_view_has_my_timeline

    me = create_user("me")
    you = create_user("you")
    weirdo = create_user("weirdo")
    me.follow!(you)
    my_message = Message.create!(user: me, body: "Sup")
    your_message = Message.create!(user: you, body: "Sup")
    weirdo_message = Message.create!(user: weirdo, body: "Sup")

    sign_in :user, me

    get :show
    assert_response :success
    assert_equal Timeline.new(me).messages, assigns(:messages)
  end

end
