require 'test_helper'

class ListsTest < Capybara::Rails::TestCase

  test "can create a list" do
    visit root_path
    click_link("Make List")
    assert new_list_path, current_path

    fill_in "lists[title]", with: "RoadTrip"
    fill_in "lists[description]", with: "to CO"
    click_button "Make List"
    assert root_path, current_path
    assert_page_has_content("RoadTrip")
  end
end
