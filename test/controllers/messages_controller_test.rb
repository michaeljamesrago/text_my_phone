require "test_helper"

class MessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    log_in_as(users(:michael))
    get new_user_phone_number_message_url(users(:michael), phone_numbers(:one))
    assert_response :success
  end

  test "should not get new message form if user not logged in" do
    get new_user_phone_number_message_url(users(:michael), phone_numbers(:one))
    assert_redirected_to login_path
  end

  test "should not get new message form if different user is logged in" do
    log_in_as(users(:michael))
    get new_user_phone_number_path(users(:steve))
    assert_redirected_to users(:michael)
  end
end
