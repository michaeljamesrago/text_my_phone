class PhoneNumber < ApplicationRecord
  belongs_to :user
  has_many :messages
  validates :number, presence: true, uniqueness: true
end
