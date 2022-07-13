class User < ApplicationRecord
    has_secure_token
    has_secure_password

    has_many :properties, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :contacts, dependent: :destroy

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :name, presence: :true, allow_blank: false
    validates :email, presence: :true, uniqueness: true, format: { with: VALID_EMAIL_REGEX, message: "is invalid" }, allow_blank: false
    
    def invalidate_token
        update(token: nil)
    end

    def self.authenticate(email, password)
        user = User.find_by(email:)
        return false unless user&.authenticate(password)
        user.regenerate_token
        user
    end

end