class Link < ActiveRecord::Base
  has_many :link_subs
  has_many :subs, through: :link_subs, source: :sub, inverse_of: :links
  has_many :comments
end
