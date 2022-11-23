require "test_helper"

class MessagesCreateTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
    @phone_number = phone_numbers(:one)
    log_in_as(@user)
  end

  # test "create new message" do
  #   get new_user_phone_number_message_url(@user, @phone_number)
  #   assert_template 'messages/new'
  #   assert_difference 'Message.count', 1 do
  #     post user_phone_number_messages_path, params: { message: { body: "This is a valid message"} }
  #   end
  #   assert_redirected_to user_phone_number_path(@user, @phone_number)
  #   follow_redirect!
  #   assert_template 'phone_numbers/show'
  # end

  test "will not create invalid message" do
    get new_user_phone_number_message_url(@user, @phone_number)
    assert_template 'messages/new'
    assert_no_difference 'Message.count' do
      post user_phone_number_messages_path, params: { message: { body: ""} }
    end
    assert_response :unprocessable_entity
    assert_template 'messages/new'
  end
end
