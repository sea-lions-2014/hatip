def random_number
  rand(1..1000)
end


  FactoryGirl.define do
    factory :user do
      email Faker::Internet.email
      first_name Faker::Name.first_name
      last_name Faker::Name.last_name
      password "password"
      stage_name "The Big Show"
      twitter_handle "tbs002"
      story Faker::Lorem.paragraph
      profile_image_url 'http://placehold.it/230X180'
      featured_youtube_url 'http://www.youtube.com/watch?v=_L9h2w798yY'
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