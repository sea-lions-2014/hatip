require 'faker'

30.times do
  User.create(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "password",
    password_confirmation: "password",
    stage_name: "The Big Show",
    twitter_handle: "tbs002",
    verified: true,
    tagline: "is this the interwebs?",
    city: Faker::Address.city,
    state: Faker::Address.state,
    country: Faker::Address.country,
    genre: "country",
    story: Faker::Lorem.paragraph,
    profile_image_url: 'http://placehold.it/230X180'
    )
end