class RemoveVerificationDigestFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :verification_digest, :string
  end
end
