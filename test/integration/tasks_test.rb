require 'test_helper'

class TasksTest < Capybara::Rails::TestCase
  def setup
    visit root_path
    click_link_or_button "Make List"
    fill_in "lists[title]", with: "RoadTrip"
    click_link_or_button "Make List"

    visit root_path
    click_link_or_button "RoadTrip"
  end

  test "can add a task to a list" do
    click_link_or_button "Create Task"

    fill_in "task[title]", with: "Pack Bags"
    fill_in "task[description]", with: "Dont forget socks"
    fill_in "task[due_date]", with: Date.tomorrow
    click_link_or_button "Make Task"
    assert_page_has_content("Pack Bags")
    assert_page_has_content("Dont forget socks")
    assert_page_has_content(Date.tomorrow)
  end

  test "can edit a task" do
    click_link_or_button "Create Task"

    fill_in "task[title]", with: "Pack Bags"
    fill_in "task[description]", with: "Dont forget socks"
    fill_in "task[due_date]", with: Date.tomorrow
    click_link_or_button "Make Task"
    assert_page_has_content("Pack Bags")
    assert_page_has_content("Dont forget socks")
    assert_page_has_content(Date.tomorrow)
    click_link_or_button "Edit Task"
    fill_in "task[title]", with: "Pack laptop"
    fill_in "task[description]", with: "Dont forget charger"
    fill_in "task[due_date]", with: Date.tomorrow
    click_link_or_button "Edit Task"
    assert_page_has_content("Pack laptop")
    assert_page_has_content("Dont forget charger")
  end


# A task has title, status (complete or incomplete) description, and a due date.
# A user can mark a task as completed.
# By default, users should only see incomplete tasks.
# A user can see completed tasks and mark them as incomplete.
end
