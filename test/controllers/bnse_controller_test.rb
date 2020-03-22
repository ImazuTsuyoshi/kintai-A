require 'test_helper'

class BnseControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get bnse_new_url
    assert_response :success
  end

end
