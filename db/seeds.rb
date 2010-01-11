# Seed me, Seymour. Seed me.
50.times do |n|
  Contact.create(
    :name         => Faker::Name.name,
    :email        => Faker::Internet.email,
    :phone_number => Faker::PhoneNumber.phone_number
  )
end
