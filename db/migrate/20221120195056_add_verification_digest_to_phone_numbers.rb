class AddVerificationDigestToPhoneNumbers < ActiveRecord::Migration[7.0]
  def change
    add_column :phone_numbers, :verification_digest, :string
  end
end
