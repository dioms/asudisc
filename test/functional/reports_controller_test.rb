require 'test_helper'

class ReportsControllerTest < ActionController::TestCase
  test "should get dues_report" do
    get :dues_report
    assert_response :success
  end

  test "should get attendance_report" do
    get :attendance_report
    assert_response :success
  end

  test "should get recently_registered" do
    get :recently_registered
    assert_response :success
  end

end
