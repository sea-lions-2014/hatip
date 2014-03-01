require 'faker'

urls = [
        "http://youtu.be/Cgoqrgc_0cM",
        "https://www.youtube.com/watch?v=ar-sduhNbi4",
        "http://youtu.be/Y34jC4I1m70",
        "http://youtu.be/2IH8tNQAzSs",
        "http://youtu.be/nQJACVmankY",
        "http://www.youtube.com/watch?v=N46x3_cObxM"
      ]

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
    profile_image_url: 'http://placehold.it/230X180',
    featured_youtube_url: urls.sample
    )
end

User.all.each do |user|
  4.times do
    user.posts.create(
      title: Faker::Lorem.words(3).join(' '),
      youtube_url: urls.sample,
      description: Faker::Lorem.sentence,
      hype: rand(1..100)
      )
  end
end
