require "test_helper"

class MessageTest < ActiveSupport::TestCase
  def setup
    @message = Message.new(body: "This is a test message")
  end

  test "should be valid" do
    assert @message.valid?
  end

  test "should require body" do
    @message.body = ""
    assert_not @message.valid?
  end

  test "should limit body to 160 chars" do
    @message.body = 'A' * 161
    assert_not @message.valid?
  end
end
