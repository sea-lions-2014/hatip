def random_number
  rand(1..1000)
end


  FactoryGirl.define do
    factory :user do
      first_name Faker::Name.first_name
      last_name Faker::Name.last_name
      email Faker::Internet.email
      password_hash "password"
      stage_name "The Big Show"
      twitter_handle "tbs002"
      verified true
      city "San Fransisco"
      state "CA"
      country "USA"
      genre "country"
      story Faker::Lorem.paragraph
      profile_image_url Faker::Internet.url
    end

    FactoryGirl.define do
      factory :post do
        title Faker::Lorem.sentence
        youtube_url Faker::Internet.url
        description Faker::Lorem.sentence
        hype random_number
      end
    end
  end