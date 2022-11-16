require "test_helper"

class PhoneNumbersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_user_phone_number_path(users(:michael))
    assert_response :success
  end
end
