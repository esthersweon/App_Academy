# == Schema Information
#
# Table name: circles
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#  title      :string(255)
#

class Circle < ActiveRecord::Base
  validates :user, :title, presence: true

  belongs_to :user
  has_many :circle_memberships, inverse_of: :circle
  has_many :members, through: :circle_memberships, source: :member

end
# member_ids = [1,2]
