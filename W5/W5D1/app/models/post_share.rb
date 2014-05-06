# == Schema Information
#
# Table name: post_shares
#
#  id         :integer          not null, primary key
#  post_id    :integer          not null
#  circle_id  :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class PostShare < ActiveRecord::Base
  belongs_to :post
  belongs_to :circle

  has_many :users, through: :post, source: :user
  has_many :links, through: :post, source: :links

end
