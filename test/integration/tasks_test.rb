require 'test_helper'

class TasksTest < Capybara::Rails::TestCase

  test "can add a task to a list" do
    visit root_path
    click_link_or_button "Make List"
    fill_in "lists[title]", with: "RoadTrip"
    click_link_or_button "Make List"

    visit root_path
    click_link_or_button "RoadTrip"
    click_link_or_button "Create Task"

    fill_in "task[title]", with: "Pack Bags"
    fill_in "task[description]", with: "Dont forget socks"
    fill_in "task[due_date]", with: Date.tomorrow
    click_link_or_button "Make Task"
    assert_page_has_content("Pack Bags")
    assert_page_has_content("Dont forget socks")
    assert_page_has_content(Date.tomorrow)
  end
end
