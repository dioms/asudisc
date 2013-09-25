require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
  test "should get members" do
    get :members
    assert_response :success
  end

end
