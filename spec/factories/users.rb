FactoryGirl.define do
  factory :user do
    email "totallyfake@email.com"
    password_hash "$2a$10$NMs7y/Q6U7zgjfE/vLHM7uYbRcKxrWvGWlVQWPAUHV9jbd1QZxJ8u"
    password_salt "$2a$10$NMs7y/Q6U7zgjfE/vLHM7u"
    username "bigfakeone"
    avatar "http://img25.photobucket.com/albums/v75/Evil_Vin/clp27.jpg"

      factory :user_with_map do
        after(:create) do |user|
          create(:map_with_pin, creator_id: user.id, user_id: user.id)
        end
      end
  end
  factory :map do
    name "my new map"
    map_lat 40.7392775
    map_long -73.9896807
      factory :map_with_pin do
        after(:create) do |map|
          create(:pin, map_id: map.id)
        end
      end
  end

  factory :pin do
    name "vinnies pizza"
    description "the joint"
    photo_url "wow.com"
    pin_lat 40.77118185975647
    pin_long -74.1796875
  end
end
