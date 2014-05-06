class Album < ActiveRecord::Base
	has_many :tracks, dependent: :destroy
end
