class UserSerializer < ActiveModel::Serializer
  attributes :name, :email, :token, :avatar_url
end
