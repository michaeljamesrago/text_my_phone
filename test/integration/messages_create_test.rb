require "test_helper"

class MessagesCreateTest < ActionDispatch::IntegrationTest

  test "create new message" do
    get new_message_path
    assert_template 'messages/new'
    assert_difference 'Message.count', 1 do
      post messages_path, params: { message: { body: "This is a valid message"} }
    end
    follow_redirect!
    assert_template 'messages/index'
  end

  test "invalid message" do
    assert_no_difference 'Message.count' do
      post messages_path, params: { message: { body: ""} }
    end
    assert_response :unprocessable_entity
    assert_template 'messages/new'
  end
end
