class Message < ApplicationRecord
  belongs_to :phone_number
  validates :body, presence: true, length: { maximum: 160 }
end
