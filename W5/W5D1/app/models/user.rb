# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)      not null
#  password_digest :string(255)      not null
#  session_token   :string(255)      not null
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  before_validation :ensure_session_token
  validates :email, :password_digest, :session_token, presence: true

  has_many :posts
  has_many :circles
  has_many :memberships, through: :circles, source: :members
  has_many :members, through: :memberships, source: :members

  def password=(password)
    unless password.empty?
      self.password_digest = BCrypt::Password.create(password)
    end
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.hex
  end

end
