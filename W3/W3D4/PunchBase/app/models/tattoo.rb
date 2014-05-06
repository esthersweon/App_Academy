class Tattoo < ActiveRecord::Base
  validates :name, :description, :fighter_id, :presence => true
  belongs_to :fighter
end
