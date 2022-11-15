class PhoneNumber < ApplicationRecord
  belongs_to :user
  validates :number, presence: true
end
