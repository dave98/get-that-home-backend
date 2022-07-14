class DetailedPropertySerializer
    include JSONAPI::Serializer
    attributes :operationType, :address, :rentType, :rentAmount, :maintenance, :propertyType, :bedrooms, :bathrooms, :area, :petsAllowed, :about, :images_url
end