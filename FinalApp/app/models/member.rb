# == Schema Information
#
# Table name: members
#
#  id         :integer          not null, primary key
#  fname      :string(255)      not null
#  lname      :string(255)      not null
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Member < ActiveRecord::Base
	validates :fname, :lname, :user_id, presence: true

	belongs_to :user, inverse_of: :members
end
