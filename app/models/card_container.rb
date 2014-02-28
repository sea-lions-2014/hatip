class CardContainer #< ActiveRecord::Base

  def artists_to_feature
    User.find(:all, :limit => 10)
  end
end