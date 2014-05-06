class Comment < ActiveRecord::Base
  validates :parent_comment_id, :link_id, :author_id, presence: true

  belongs_to :link
  belongs_to :author,
  class_name: "User",
  foreign_key: :author_id

  has_many :children,
  class_name: "Comment",
  foreign_key: :parent_comment_id,
  primary_key: :id

  has_one :parent,
  class_name: "Comment",
  foreign_key: :parent_comment_id,
  primary_key: :id

end
