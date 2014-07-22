require 'test_helper'

class SearchInBrowserTest < ActionDispatch::IntegrationTest

  def test_can_search_for_message
    bill = create_user("bill")
    visit root_path

    bill.messages.create(body: 'xyz should show')
    bill.messages.create(body: 'abc should not show')

    within("#new_user") do
      fill_in 'Email', :with => bill.email
      fill_in 'Password', :with => "memememe"
      click_button "Sign in"
    end

    within(".search-and-submit") do
      fill_in 'Enter Search', with: 'xyz'
      click_button 'submit-search'
    end

    save_and_open_page
    assert page.has_content?("xyz"), "XYZ should have shown on page"
    assert !page.has_content?("abc"), "ABC should not have shown"

  end
end
