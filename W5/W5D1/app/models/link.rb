# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  post_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Link < ActiveRecord::Base
  belongs_to :post

  has_many :users, through: :post, source: :user
  has_many :post_shares, through: :post, source: :post_shares

end
