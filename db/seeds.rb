User.destroy_all

puts "Seeding custom users"
user = User.create(name: "DaveSeeker", password: "123456", phone: "99999999", email: "dave.seeker@gmail.com")
user = User.create(name: "DaveLandLord", password: "123456", phone: "88888888", email: "dave.land.lord@gmail.com")

User.new(name: "DaveSeeker", password: "123456", phone: "99999999", email: "dave.seeker@gmail.com")

puts "Completed"