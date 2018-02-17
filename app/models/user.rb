class User < ApplicationRecord

  # DB relationships
  has_one :invite

  # Data validations
  EMAIL_PATTERN = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  validates :first_name,
    length: { within: 2...252, message: 'length-message' },
    presence: { message: 'not_present' }

  validates :first_last_name,
    length: { within: 2...252, message: 'length-message' },
    presence: { message: 'not_present' }

  validates :email,
    length: { maximum: 120, message: 'length-message' },
    allow_blank: true,
    format: { with: EMAIL_PATTERN, message: 'format-message' }

  enum rsvp: [ :pending, :accepted, :declined ]

  scope :by_rsvp, ->(rsvp) { where("users.rsvp = ?", rsvp) }

  scope :by_invite_and_user, ->(invite, user_id) { where("users.invite_id = ? and users.id = ?", invite, user_id) }
end
