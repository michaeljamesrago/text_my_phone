class AddIndexToPhoneNumbersNumber < ActiveRecord::Migration[7.0]
  def change
    add_index :phone_numbers, :number, unique: true
  end
end
