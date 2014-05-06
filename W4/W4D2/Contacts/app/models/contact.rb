class Contact < ActiveRecord::Base
	validates :name, :email, :user_id, presence: true
	validates :email, uniqueness: true
  
  belongs_to :owner, 
  class_name: "User", 
  foreign_key: :user_id

  has_many :contact_shares

  has_many :shared_users, through: :contact_shares, source: :user

  def self.contacts_for_user_id(user_id)
    joins_cond = <<-SQL
      LEFT OUTER JOIN
        contact_shares ON contacts.id = contact_shares.contact_id
    SQL
    where_cond = <<-SQL
      ((contacts.user_id = :user_id) OR (contact_shares.user_id = :user_id))
    SQL

    Contact.joins(joins_cond).where(where_cond, :user_id => user_id).uniq
  end

end
