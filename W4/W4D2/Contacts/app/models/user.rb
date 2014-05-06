class User < ActiveRecord::Base
  validates :username, presence: true

  has_many :contacts, dependent: :destroy
  has_many :contact_shares
  has_many :shared_contacts, through: :contact_shares, source: :contact


end
