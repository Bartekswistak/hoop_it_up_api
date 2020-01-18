class User < ApplicationRecord
    has_secure_password
    has_one :playercard

    validates :username, :email, :password, presence: true 
    validates :username, uniqueness: true
end
