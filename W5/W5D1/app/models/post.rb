# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base
  has_many :links
  has_many :post_shares
  belongs_to :user

  has_many :circles, through: :post_shares, source: :circle

end
