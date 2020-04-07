require 'test_helper'

class ApprovalsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get approvals_new_url
    assert_response :success
  end

end
