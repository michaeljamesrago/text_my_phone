class PhoneNumber < ApplicationRecord
  attr_accessor :verification_code
  before_create :create_verification_digest
  belongs_to :user
  has_many :messages
  validates :number, presence: true, uniqueness: true

  def PhoneNumber.new_verification_code
    6.times.map{rand(10)}.join
  end

  def PhoneNumber.digest(code)
    Digest::SHA256.hexdigest(code)
  end

  def create_verification_digest
    self.verification_code = PhoneNumber.new_verification_code
    self.verification_digest = PhoneNumber.digest(verification_code)
  end

  def send_verification_text
    client = Twilio::REST::Client.new
    client.messages.create(
      from: ENV['TWILIO_FROM_NUMBER'],
      body: "Hello! Your TextMyPhone verification code is #{verification_code}",
      to: number
    )
  end

  def send_sms(body)
    client = Twilio::REST::Client.new
    client.messages.create(
      from: ENV['TWILIO_FROM_NUMBER'],
      body: body,
      to: number
    )
  end

  def verify
    toggle!(:verified)
  end
end
