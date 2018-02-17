class InviteSerializer < ActiveModel::Serializer
  attributes :tag

  has_many :users
end
