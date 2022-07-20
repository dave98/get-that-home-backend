require "faker"


general_config = {
    none: { users: 0, properties: 0 },
    few: { users: 10, properties: 30 },
    medium: { users: 50, properties: 150 },
    many: { users: 100, properties: 300 },
}

current_config = :medium

puts "Destroying" 
Like.destroy_all
puts "Likes"
Contact.destroy_all
puts "Contacts"
User.destroy_all
puts "Users"
Property.destroy_all
puts "Properties"

puts "Seeding custom users"

user = User.create(name: "DaveSeeker", password: "123456", phone: "99999999", email: "dave.seeker@gmail.com")
random_avatar = rand(1..13)
user.avatar.attach(io: File.open("db/images/avatars/avatar#{random_avatar}.png"), filename: "avatar#{random_avatar}.png" )

user = User.create(name: "DaveLandLord", password: "123456", phone: "88888888", email: "dave.land.lord@gmail.com")
random_avatar = rand(1..13)
user.avatar.attach(io: File.open("db/images/avatars/avatar#{random_avatar}.png"), filename: "avatar#{random_avatar}.png" )

puts "Seeding users"
general_config[current_config][:users].times do
    tpassword = Faker::Internet.password
    user = User.new(name: Faker::Name.name, email: Faker::Internet.email, phone: Faker::PhoneNumber.cell_phone, password: tpassword, password_confirmation: tpassword)
    if user.valid?
        user.save

        random_avatar = rand(1..13)
        user.avatar.attach(io: File.open("db/images/avatars/avatar#{random_avatar}.png"), filename: "avatar#{random_avatar}.png" )
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
        address: Faker::Address.full_address + ", " + Faker::Address.city + ", " + Faker::Address.country,
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

        rand(1..5).times do
            random_department = rand(1..30)
            property.images.attach(io: File.open("db/images/departments/department#{random_department}.jpg"), filename: "department#{random_department}.jpg" )
        end
    else
        p property.errors.full_messages
    end
end

puts "Seeding likes"
created_users = User.all
created_properties = Property.all
general_config[current_config][:users].times do
    created_users.sample.likes.create(property: created_properties.sample)
end

puts "Seeding contacts"
created_users = User.all
created_properties = Property.all
general_config[current_config][:users].times do
    created_users.sample.contacts.create(property: created_properties.sample, message: Faker::Hipster.paragraph_by_chars(characters: 20))
end

puts "Completed"