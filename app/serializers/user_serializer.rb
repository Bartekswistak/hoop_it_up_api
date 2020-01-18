class UserSerializer < ActiveModel::Serializer
    attributes :id, :username, :email, :password

    has_one :playercard
  end