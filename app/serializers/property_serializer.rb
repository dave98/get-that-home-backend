class PropertySerializer < ActiveModel::Serializer
  attributes :id, :operationType, :address, :rentAmount, :propertyType, :bedrooms, :bathrooms, :area, :petsAllowed, :base_image_url
end