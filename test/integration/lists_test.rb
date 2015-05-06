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
    assert_page_has_content("to CO")
  end

  test "can edit a list" do
    visit root_path
    click_link("Make List")
    assert new_list_path, current_path

    fill_in "lists[title]", with: "RoadTrip"
    fill_in "lists[description]", with: "to CO"
    click_button "Make List"
    assert root_path, current_path
    assert_page_has_content("RoadTrip")
    assert_page_has_content("to CO")
    click_button("Edit List")
    fill_in "list[title]", with: "RoadTrip2"
    fill_in "list[description]", with: "to CO2"
    click_button("Update List")
    assert_page_has_content("RoadTrip2")
    assert_page_has_content("to CO2")
  end

  test "can archive a list" do
    visit root_path
    click_link("Make List")
    assert new_list_path, current_path

    fill_in "lists[title]", with: "RoadTrip"
    fill_in "lists[description]", with: "to CO"
    click_button "Make List"
    assert root_path, current_path
    assert_page_has_content("RoadTrip")
    assert_page_has_content("to CO")
    click_button("Edit List")
    check('list_archived')
    click_button("Update List")
    assert root_path, current_path
    refute page.has_content?("RoadTrip")
    refute page.has_content?("to CO")
  end

  test "can view & delete archived list" do
    visit root_path
    click_link("Make List")
    assert new_list_path, current_path

    fill_in "lists[title]", with: "RoadTrip"
    fill_in "lists[description]", with: "to CO"
    click_button "Make List"
    assert root_path, current_path
    assert_page_has_content("RoadTrip")
    assert_page_has_content("to CO")
    click_button("Edit List")
    check('list_archived')
    click_button("Update List")
    assert root_path, current_path
    refute page.has_content?("RoadTrip")
    refute page.has_content?("to CO")
    click_link("Archived Lists")
    assert page.has_content?("RoadTrip")
    assert page.has_content?("to CO")
    click_button("Delete List")
    refute page.has_content?("RoadTrip")
    refute page.has_content?("to CO")
  end
end
