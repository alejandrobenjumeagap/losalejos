class Invite < ApplicationRecord

  # DB relationships
  has_many :users

  # Data validations
  validates :token,
    length: { maximum: 5, message: 'length-message' },
    format: { with: /\A[a-zA-Z0-9]+\z/, message: 'format-message' },
    presence: { message: 'presence-message' }

  validates :tag,
    length: { within: 2...252, message: 'length-message' },
    format: { with: /\A[a-zA-ZáéíñóúüÁÉÍÑÓÚÜ\s,]+\z/, message: 'format-message' },
    presence: { message: 'presence-message' }

end