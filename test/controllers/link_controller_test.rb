require 'test_helper'

class LinkControllerTest < ActionDispatch::IntegrationTest
  test "should get get_access_token" do
    get link_get_access_token_url
    assert_response :success
  end

end
