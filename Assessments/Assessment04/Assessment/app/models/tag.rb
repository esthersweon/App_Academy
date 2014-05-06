class Tag < ActiveRecord::Base
	validates :post_id, :name, presence: true

	belongs_to :post
end
