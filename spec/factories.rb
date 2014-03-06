
  FactoryGirl.define do

    urls = [
      "http://www.youtube.com/watch?v=l4nvzB7DT4M",
      "http://www.youtube.com/watch?v=uue6oJ_jDns",
      "http://www.youtube.com/watch?v=X_xNbtlgiMI",
      "http://www.youtube.com/watch?v=ldsYjFRsRU8",
      "http://www.youtube.com/watch?v=-Ow8Gut-4XY",
      "http://www.youtube.com/watch?v=83OCgca9N3k",
      "http://www.youtube.com/watch?v=Pbdewwtm70w",
      "http://www.youtube.com/watch?v=GNZBSZD16cY",
      "http://www.youtube.com/watch?v=y7_ZrShOtEE"
    ]

    factory :user do
      email { Faker::Internet.email }
      first_name { Faker::Name.first_name }
      last_name { Faker::Name.last_name }
      password "password"
      stage_name "The Big Show"
      twitter_handle "tbs002"
      story { Faker::Lorem.paragraph }
      profile_image_url 'http://placehold.it/230X180'
      featured_youtube_url 'http://www.youtube.com/watch?v=_L9h2w798yY'
      category "vocal"
    end

      factory :post do
        title { Faker::Lorem.sentence }
        youtube_url urls.sample
        description { Faker::Lorem.sentence }
        hype 4
        user
      end
    end
