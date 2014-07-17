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

Pin.create({
  map_id: map.id,
  name: "my favorite bench",
  description: "its nice",
  photo_url: "http://vinniesnewyorkpizza.com/images/web/walloffame.jpg",
  pin_lat: 40.728527124206,
  pin_long: -73.9393615722656
})

Pin.create({
  map_id: map.id,
  name: "hot dog on a stick",
  description: "its nice",
  photo_url: "http://vinniesnewyorkpizza.com/images/web/walloffame.jpg",
  pin_lat: pin_lat: 40.7066689811733,
  pin_long: -74.1810607910156
})

Pin.create({
  map_id: map.id,
  name: "fred flinstone's house",
  description: "its nice",
  photo_url: "http://vinniesnewyorkpizza.com/images/web/walloffame.jpg",
  pin_lat: pin_lat: 40.6952166135172,
  pin_long: -74.3980407714844
})

Pin.create({
  map_id: map.id,
  name: "juice bar",
  description: "its nice",
  photo_url: "http://vinniesnewyorkpizza.com/images/web/walloffame.jpg",
  pin_lat: pin_lat: 40.7569774907177,
  pin_long: -73.9853668212891
})

Pin.create({
  map_id: map.id,
  name: "a dog walk",
  description: "its nice",
  photo_url: "http://vinniesnewyorkpizza.com/images/web/walloffame.jpg",
  pin_lat: pin_lat: 40.7424124233837,
  pin_long: -73.9826202392578
})


