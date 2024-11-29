require "test_helper"

class MissionControlTest < ActionDispatch::IntegrationTest
  test "mission control cannot be accessed when logged out" do
    get mission_control_jobs_path
    assert_response :not_found
  end

  test "mission control cannot be accessed when not an admin" do
    login users(:one)
    get mission_control_jobs_path
    assert_response :not_found
  end

  test "mission control can be accessed when the user is an admin" do
    login users(:admin)
    get mission_control_jobs_path
    assert_response :success
  end
end
