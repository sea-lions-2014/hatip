require 'spec_helper'

describe YoutubeBuddy do

  it "should return youtube id given standard format" do
    youtube = YoutubeBuddy.new("http://www.youtube.com/watch?v=4LvMeYEwWGQ")
    expect(youtube.youtube_id).to eq("4LvMeYEwWGQ")
  end

  it "should return youtube id given short format" do
    youtube = YoutubeBuddy.new("http://youtu.be/tHBWfzIg5YY")
    expect(youtube.youtube_id).to eq("tHBWfzIg5YY")
  end

  it "should return an iframe with the embed url" do
    youtube = YoutubeBuddy.new("http://youtu.be/tHBWfzIg5YY")
    expect(youtube.iframe_html(390, 640)).to eq(%Q{<iframe title="YouTube video player" width="640" height="390" src="http://www.youtube.com/embed/tHBWfzIg5YY?controls=0&showinfo=0&rel=0"  frameborder="0" allowfullscreen></iframe>})
  end

  it "should return a jpeg thumbnail url from the given youtube url" do
    youtube = YoutubeBuddy.new("http://youtu.be/tHBWfzIg5YY")
    expect(youtube.thumbnail_url).to eq("http://img.youtube.com/vi/tHBWfzIg5YY/0.jpg")
  end
end