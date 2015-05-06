require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  def setup
    @task = Task.new(title: "Pack Bags", description: "Dont forget socks", due_date: Date.tomorrow, status: false)
  end

  test "task has a the proper data" do
    assert_equal "Pack Bags", @task.title
    assert_equal "Dont forget socks", @task.description
    assert_equal Date.tomorrow, @task.due_date
    assert_equal false, @task.status
  end

  test "it belongs to a list" do
    list = List.new(title: "Pack Bags")
    @task.list = list
    assert_equal list, @task.list
  end
end
