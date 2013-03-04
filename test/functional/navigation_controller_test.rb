require 'test_helper'

class NavigationControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get jobs" do
    get :jobs
    assert_response :success
  end

  test "should get executive_page" do
    get :executive_page
    assert_response :success
  end

end
