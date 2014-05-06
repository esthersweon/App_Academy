# == Schema Information
#
# Table name: circle_memberships
#
#  id         :integer          not null, primary key
#  member_id  :integer          not null
#  created_at :datetime
#  updated_at :datetime
#  circle_id  :integer
#

class CircleMembership < ActiveRecord::Base
  validates :member, :circle, presence: true

  # has_many :members,
  # class_name: "User",
  # foreign_key: :circle_id,
  # primary_key: :id
  belongs_to :member, class_name: 'User', :foreign_key => :member_id
  belongs_to :circle, inverse_of: :circle_memberships

  # has_one :user, through: :circle, source: :user

end
