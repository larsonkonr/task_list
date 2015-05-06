require 'test_helper'

class ListTest < ActiveSupport::TestCase
  test "has a the right data" do
    list = List.new(title: "Roadtrip", description: "Summer roadtrip to CO")
    assert_equal "Roadtrip", list.title
    assert_equal "Summer roadtrip to CO", list.description
  end

  test "is not archived" do
    list = List.new
    assert_equal false, list.archived
  end
end
