require "faker"


general_config = {
    none: { users: 0, properties: 0 },
    few: { users: 10, properties: 30 },
    medium: { users: 50, properties: 150 },
    many: { users: 100, properties: 300 },
}

current_config = :many

User.destroy_all
Property.destroy_all

puts "Seeding custom users"
user = User.create(name: "DaveSeeker", password: "123456", phone: "99999999", email: "dave.seeker@gmail.com")
user = User.create(name: "DaveLandLord", password: "123456", phone: "88888888", email: "dave.land.lord@gmail.com")

puts "Seeding users"
general_config[current_config][:users].times do
    tpassword = Faker::Internet.password
    user = User.new(name: Faker::Name.name, email: Faker::Internet.email, phone: Faker::PhoneNumber.cell_phone, password: tpassword, password_confirmation: tpassword)
    if user.valid?
        user.save
    else
        p user.errors.full_messages
    end
end 


puts "Seeding properties"
created_users = User.all
general_config[current_config][:properties].times do
    property = Property.new(
        user: created_users.sample,
        operationType: :rent,
        address: Faker::Address.full_address, 
        rentType: :monthly,
        rentAmount: rand(1..2000), 
        maintenance: rand(1..500), 
        propertyType: :aparment,
        bedrooms: rand(1..10), 
        bathrooms: rand(1..5), 
        area: rand(1..10000), 
        petsAllowed: Faker::Boolean.boolean(true_ratio: 0.2), 
        about: Faker::Hipster.paragraph_by_chars(characters: 300) )
    if property.valid?
        property.save
    else
        p property.errors.full_messages
    end
end

puts "Completed"