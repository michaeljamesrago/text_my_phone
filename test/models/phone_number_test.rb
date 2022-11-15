require "test_helper"

class PhoneNumberTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @phone_number = @user.phone_numbers.build(number: "13176051444")
  end

  test "should be valid" do
    assert @phone_number.valid?
  end

  test "user_id should be present" do
    @phone_number.user_id = nil
    assert_not @phone_number.valid?
  end

  test "default verified should be false" do
    assert_not @phone_number.verified
  end

  test "number should be unique" do
    duplicate_phone_number = @phone_number.dup
    @phone_number.save
    assert_not duplicate_phone_number.valid?
  end
end
