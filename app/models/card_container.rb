# I don't like CardContainer as a name
class CardContainer
  def self.artists_to_feature
    User.find(:all, :limit => 10)
  end
end
