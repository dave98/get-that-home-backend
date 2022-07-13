class Property < ApplicationRecord
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :contacts, dependent: :destroy

    enum operationType: { rent: 0, sale: 1 }
    enum rentType: { weekly: 0, monthly: 1, anual: 2, custom: 3 }
    enum propertyType: { aparment: 0, house: 1}

    validates :operationType, presence: true
    validates :address, presence: true, length: { in: 10..100 }, allow_blank: false
    validates :rentType, presence: true
    validates :rentAmount, presence: true
    validates :maintenance, presence: true
    validates :propertyType, presence: true
    validates :bedrooms, presence: true
    validates :bathrooms, presence: true
    validates :area, presence: true
    validates :petsAllowed, inclusion: { in: [true, false]}
    validates :about, presence: true, length: { in: 20..500 }, allow_blank: false
end