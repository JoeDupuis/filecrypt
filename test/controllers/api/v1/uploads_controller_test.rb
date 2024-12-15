require "test_helper"

class Api::V1::UploadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @upload = uploads(:one)
  end

  test "uploads links are inline" do
    skip
  end
end
