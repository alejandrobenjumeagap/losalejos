class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :second_name, :first_last_name, :second_last_name, :email, :rsvp

  has_one :invite
end
