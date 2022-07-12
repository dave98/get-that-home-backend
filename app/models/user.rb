class User < ApplicationRecord
    has_secure_password
    has_many :properties, dependent: :destroy
    has_many :liked, dependent: :destroy
    has_many :contacted, dependent: :destroy

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :name, presence: :true, allow_blank: false
    validates :email, presence: :true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }, allow_blank: false
    validates :password, presence: true
end