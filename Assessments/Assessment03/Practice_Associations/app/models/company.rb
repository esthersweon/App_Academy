class Company < ActiveRecord::Base

	has_many :prices

	belongs_to :exchange

	has_one :board

	has_many :watch_list_items, 
	class_name: "WatchListItem",
	foreign_key: :company_id,
	primary_key: :id

	has_many :watch_lists, through: :watch_list_items, source: :watch_list

	has_many :watchers, through: :watch_lists, source: :user

end
