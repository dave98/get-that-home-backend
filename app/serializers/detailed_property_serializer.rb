class DetailedPropertySerializer
    include JSONAPI::Serializer
    attributes :id, :operationType, :address, :rentType, :rentAmount, :maintenance, :propertyType, :bedrooms, :bathrooms, :area, :petsAllowed, :about, :images_url, :closed
end