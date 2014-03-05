require 'rubygems'
require 'google/api_client'
require 'trollop'
require 'youtube_it'
require 'faker'



# Set DEVELOPER_KEY to the "API key" value from the "Access" tab of the
# Google Developers Console <https://cloud.google.com/console>
# Please ensure that you have enabled the YouTube Data API for your project.
DEVELOPER_KEY = "AIzaSyCE0MVxKIJWDbbcfFBDwqD2PW7Igpo8zwY"
YOUTUBE_API_SERVICE_NAME = "youtube"
YOUTUBE_API_VERSION = "v3"
client = Google::APIClient.new(:key => DEVELOPER_KEY,
                               :authorization => nil)
youtube = client.discovered_api(YOUTUBE_API_SERVICE_NAME, YOUTUBE_API_VERSION)
yt_client = YouTubeIt::Client.new(:dev_key => DEVELOPER_KEY)


search_terms =  [
  "street performer",
  "street dancing",
  "street muscians",
  "street performer boston",
  "street performer new york",
  "street performer san francisco ",
  "street performer los angeles ",
  "street performer london ",
  "street performer tokyo ",
  "street performer shanghai ",
  "street performer miami ",
  "street performer new orleans ",
  "street performer houston",
  "street performer chicago",
  "street performer seattle",
  "street performer washington dc",
  "street performer austin",
  "street performer dallas",
  "street performer orlando",
  "street performer phoenix",
  "street dancer boston",
  "street dancer new york",
  "street dancer san francisco ",
  "street dancer los angeles ",
  "street dancer london ",
  "street dancer tokyo ",
  "street dancer shanghai ",
  "street dancer miami ",
  "street dancer new orleans ",
  "street dancer houston",
  "street dancer chicago",
  "street dancer seattle",
  "street dancer washington dc",
  "street dancer austin",
  "street dancer dallas",
  "street dancer orlando",
  "street dancer phoenix",
  "street muscian boston",
  "street muscian new york",
  "street muscian san francisco ",
  "street muscian los angeles ",
  "street muscian london ",
  "street muscian tokyo ",
  "street muscian shanghai ",
  "street muscian miami ",
  "street muscian new orleans ",
  "street muscian houston",
  "street muscian chicago",
  "street muscian seattle",
  "street muscian washington dc",
  "street muscian austin",
  "street muscian dallas",
  "street muscian orlando",
  "street muscian phoenix",
  "Zhivago Blea standup comedy"]

urls = [
        "http://youtu.be/hXlzci1rKNM",
        "http://youtu.be/puSkP3uym5k",
        "http://youtu.be/YPYGeELPpno",
        "http://youtu.be/ub26kLEfphw",
        "http://youtu.be/sUlfGOezE48",
        "http://youtu.be/wphB0fq4PlA",
        "https://www.youtube.com/watch?v=uXMuWi0dUBc",
        "https://www.youtube.com/watch?v=-Ow8Gut-4XY",
        "https://www.youtube.com/watch?v=wphB0fq4PlA",
        "https://www.youtube.com/watch?v=uue6oJ_jDns",
        "https://www.youtube.com/watch?v=JlfsXd62Qss",
        "https://www.youtube.com/watch?v=szeq1M0_7PQ",
        "https://www.youtube.com/watch?v=rLGpdkYEwrw",
        "http://www.youtube.com/watch?v=jEA9aG0UNVA"
      ]

profile_image_urls = [
  "http://upload.wikimedia.org/wikipedia/commons/1/14/Street_performer,_Paris_December_30,_2007.jpg",
  "http://stuffiveseenonmybikeinneworleans.files.wordpress.com/2008/06/ladder-street-performer-1.jpg",
  "http://www.eclectablog.com/wp-content/uploads/2013/10/StreetPerformer.jpg",
  "http://upload.wikimedia.org/wikipedia/commons/3/3d/Street_performer,_Liverpool_-_DSC06888.JPG",
  "http://myephemerality.com/wp-content/uploads/2009/10/20070405-DSC6801_Street_Performers.jpg",
  "http://www.prlog.org/10237907-dk-is-street-performer-and-cowboy.jpg",
  "http://metrouk2.files.wordpress.com/2012/12/street-performer-poses-with-ipad-showing-time-of-121212-in-madrid-ay_99689642.jpg",
  "http://www.theroadtoanywhere.com/wp-content/uploads/2011/11/italy-street-performer-florence.jpg",
  "http://thumbs.dreamstime.com/z/supple-street-performer-aurillac-france-august-portrait-very-named-jyoti-as-part-aurillac-international-theater-35159453.jpg",
  "http://upload.wikimedia.org/wikipedia/commons/a/ae/A_Girl_Playing_Grip_(Street_Performer).jpg",
  "http://www.sfexaminer.com/imager/supervisors-decided-to-allow-public-health-department-to-cite-loud-street-p/b/original/2350237/deae/street_performer2.jpg",
  "http://gridskipper.com/assets/resources/2008/04/germanstreetperformer424.jpg",
  "http://www.richardalois.com/wp-content/uploads/2011/08/Street-Performer-London-Southbank.jpg",
  "http://shutterific.files.wordpress.com/2012/01/street-performer-2.jpg",
  "http://ackadia.com/gallery/var/albums/people/street-performer-statue-blackpool.JPG?m=1338835884",
  "http://upload.wikimedia.org/wikipedia/commons/e/e2/Street_Performer,_Sacr%C3%A9-C%C5%93ur,_Paris.JPG",
  "http://travelingcanucks.com/wp-content/uploads/2012/09/street-performer-germany.jpg",
  "http://beckyyk.files.wordpress.com/2012/11/meaghan_street_performer.jpg",
  "http://cambridge.com/wp-content/uploads/2013/06/street-performer-1-in-picture-Eric-Royer.jpg",
  "http://neworleanseasytravelguide.com/wp-content/uploads/2012/12/Street-Performer-1-800x1200.jpg",
  "http://genxtraordinary.files.wordpress.com/2011/04/street-performer.jpg",
  "http://traskavenue.files.wordpress.com/2012/07/street-performers.jpg",
  "http://4.bp.blogspot.com/-m49E3s4tzz0/TbV8aCBeHkI/AAAAAAAAAS8/Ompp4q4Pcao/s1600/IMG_2745.JPG",
  "http://lloydi.com/travel-writing/barcelona/images/somersault.jpg",
  "http://thumbs.dreamstime.com/z/street-performer-charlie-chaplin-17110218.jpg"
]

20.times do
  first_name = Faker::Name.first_name
  User.create(
    email: Faker::Internet.email,
    first_name: first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "password",
    password_confirmation: "password",
    stage_name: first_name,
    twitter_handle: Faker::Lorem.word,
    verified: false,
    tagline: Faker::Lorem.sentence,
    city: Faker::Address.city,
    state: Faker::Address.state,
    country: Faker::Address.country,
    story: Faker::Lorem.paragraph,
    featured_youtube_url: urls.sample,
    profile_image_url: profile_image_urls.sample
    )
end

categories = ["music", "dance", "acrobat", "other"]

User.all.each do |user|

    opts = Trollop::options do
      opt :q, 'Search term', :type => String, :default => search_terms.sample
      opt :maxResults, 'Max results', :type => :int, :default => 5
    end

    opts[:part] = 'id,snippet'
    search_response = client.execute!(
      :api_method => youtube.search.list,
      :parameters => opts
    )
    # Create results
    search_response.data.items.each do |search_result|
      if search_result.id.kind == 'youtube#video'
        video = yt_client.video_by(search_result.id.videoId)
          if video.noembed == false && video.view_count > 1000 && video.duration > 20
            id = video.unique_id
            title = video.title
            video.description ? description = video.description : description = ""
            video.uploaded_at ? uploaded_at = video.uploaded_at : uploaded_at = Time.now
            video.view_count ? view_count = video.view_count : view_count = 0
            video.duration ? duration = video.duration : duration = 0
            user.posts.create(
              title: title,
              youtube_url: "http://www.youtube.com/watch?v=" + id,
              description: description,
              hype: rand(1..100),
              category: categories.sample
              )
          end
      end
  end
end
