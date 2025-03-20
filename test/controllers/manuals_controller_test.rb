require "test_helper"

class ManualsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get manuals_index_url
    assert_response :success
  end
end
