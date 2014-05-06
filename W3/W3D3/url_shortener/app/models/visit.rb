class Visit < ActiveRecord::Base

  belongs_to :users, 
  class_name: "User", 
  foreign_key: :visitor_id, 
  primary_key: :id

  belongs_to :shortened_urls, 
  class_name: "ShortenedURL", 
  foreign_key: :visited_url_id, 
  primary_key: :id

  def self.record_visit!(user, shortened_url)
    Visit.create!( {:visitor_id => user.id, :visited_url_id => shortened_url.id} )
  end

end