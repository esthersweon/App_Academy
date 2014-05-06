class Board < ActiveRecord::Base
	belongs_to :company

	has_many :memberships, 
	class_name: "BoardMembership", 
	foreign_key: :board_id,
	primary_key: :id

	has_many :members, through: :memberships, source: :member

	has_one :exchange, through: :company, source: :exchange

end
