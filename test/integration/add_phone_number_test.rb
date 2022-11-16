require "test_helper"

class AddPhoneNumberTest < ActionDispatch::IntegrationTest
  
  test "should add valid phone number" do
    log_in_as(users(:michael))
    get new_user_phone_number_path(users(:michael))
    assert_template 'phone_numbers/new'
    assert_difference 'PhoneNumber.count', 1 do
      post user_phone_numbers_path(users(:michael)), params: { phone_number: { number: "00000000000" } }
    end
    follow_redirect!
    assert_template 'users/show'
  end

  test "should redirect to login if no user signed in" do
    get new_user_phone_number_path(users(:michael))
    assert_redirected_to login_url
  end

  test "should redirect if wrong user signed in" do
    log_in_as(users(:steve))
    get new_user_phone_number_path(users(:michael))
    assert_redirected_to user_path(users(:steve))
  end
end
