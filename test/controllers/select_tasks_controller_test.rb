require 'test_helper'

class SelectTasksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get select_tasks_index_url
    assert_response :success
  end

end
