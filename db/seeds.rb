# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Map.delete_all
Pin.delete_all

user = User.new({
  email: "awesome@email.com",
  password: "app1234",
  password_confirmation: "app1234",
  username: "bigfakeone",
  avatar: "http://img25.photobucket.com/albums/v75/Evil_Vin/clp27.jpg"
})

user.save

map = Map.create({
  creator_id: user.id,
  user_id: user.id,
  name: "my new map",
  map_lat: 40.7392775,
  map_long: -73.9896807
})

Pin.create({
  map_id: map.id,
  name: "vinnies pizza",
  description: "good pizza",
  photo_url: "http://vinniesnewyorkpizza.com/images/web/walloffame.jpg",
  pin_lat: 40.6848036615912,
  pin_long: -73.9215087890625
})
