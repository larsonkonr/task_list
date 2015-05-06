require 'test_helper'

class RootTest < Capybara::Rails::TestCase

  test "has lists" do
    visit root_path
    assert page.has_content?('WunderListClone')
    assert page.has_content?('ToDo Lists')
  end
end
