namespace :hype do
  desc "TODO"
  task :update => :environment do
    Post.all.each do |post|
      HypeBuddy.new(post).update_hype_score
    end
  end
end
