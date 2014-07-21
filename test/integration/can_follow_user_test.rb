require 'test_helper'

class CanFollowUserTest < ActionDispatch::IntegrationTest

  def test_can_sign_in
    bill = create_user("bill")
    create_user("ted")
    visit root_path

    within("#new_user") do
      fill_in 'Email', :with => bill.email
      fill_in 'Password', :with => "memememe"
      click_button "Sign in"
    end

    assert page.has_content?("Timeline#show")
  end

  def test_can_follow_user
    bill = create_user("bill")
    ted = create_user("ted")
    visit root_path

    within("#new_user") do
      fill_in 'Email', :with => bill.email
      fill_in 'Password', :with => "memememe"
      click_button "Sign in"
    end

    visit users_path

    click_link "Follow Ted"

    assert bill.follow?(ted), "Bill should follow ted"

  end

end
