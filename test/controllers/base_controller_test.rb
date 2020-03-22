require 'test_helper'

class BaseControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get base_new_url
    assert_response :success
  end

end
