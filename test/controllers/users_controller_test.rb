require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  include Devise::TestHelpers

  def test_list_has_correct_users
    bill = create_user("bill")
    sign_in :user, bill
    
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  def test_can_make_follow
    bill = create_user("bill")
    ted = create_user("ted")
    sign_in :user, bill

    post :follow, user_id: ted.id

    assert bill.follow?(ted)

  end
end
