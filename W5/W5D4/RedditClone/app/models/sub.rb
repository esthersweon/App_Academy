class Sub < ActiveRecord::Base
  validates :name, :moderator, presence: true

  belongs_to :moderator,
  class_name: "User",
  foreign_key: :moderator_id,
  primary_key: :id

  has_many :link_subs, class_name: "LinkSub", foreign_key: :sub_id
  has_many :links, through: :link_subs, source: :link, inverse_of: :subs

end
