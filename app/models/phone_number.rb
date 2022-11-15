class PhoneNumber < ApplicationRecord
  belongs_to :user
  validates :number, presence: true, uniqueness: true
end
