class ShortenedURL < ActiveRecord::Base
  include SecureRandom

  validates :short_url, :presence => true
  validates :short_url, :uniqueness => true

  belongs_to :submitter, 
  :class_name => "User", 
  :foreign_key => :submitter_id, 
  :primary_key => :id

  has_many :visits, 
  :class_name => "Visit", 
  :foreign_key => :visited_url_id, 
  :primary_key => :id

  has_many :visitors, through: :visits, source: :users

  def self.random_code
    new_code = nil

    loop do
      new_code = SecureRandom.urlsafe_base64
      break if self.find_by(:short_url => new_code).nil?
    end

    new_code
  end

  def self.create_for_user_and_long_url!(user, long_url)
    new_short_url = self.random_code

    ShortenedURL.create!({ :long_url => long_url, :short_url => new_short_url, :submitter_id => user.id })
  end

  def num_clicks
    self.visitors.count
  end

  def num_uniques
    self.visitors.distinct.count
  end

  def num_recent_uniques
    self.visitors.where(:created_at => 10.minutes.ago..Time.now).distinct.count
  end

end

