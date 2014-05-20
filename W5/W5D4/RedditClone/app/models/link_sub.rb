class LinkSub < ActiveRecord::Base
  validates :sub_id, :link_id, presence: true

  belongs_to :link

  belongs_to :sub

end
