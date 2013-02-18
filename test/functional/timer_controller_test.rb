require 'test_helper'

class TimerControllerTest < ActionController::TestCase
  test "should get timer" do
    get :timer
    assert_response :success
  end

end
