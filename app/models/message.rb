class Message < ApplicationRecord
  validates :body, presence: true, length: { maximum: 160 }
end
