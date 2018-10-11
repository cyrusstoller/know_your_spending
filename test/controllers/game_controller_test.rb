require 'test_helper'

class GameControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get game_home_url
    assert_response :success
  end

  test "should get question" do
    get game_question_url
    assert_response :success
  end

end
