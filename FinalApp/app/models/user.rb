# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)      not null
#  password_digest :string(255)      not null
#  session_token   :string(255)      not null
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
	before_validation :ensure_session_token
	validates :username, :password_digest, presence: true
	validates :username, uniqueness: true
	validates :password, length: {minimum: 6, allow_nil: true}

	attr_reader :password 

	def self.find_by_credentials(username, password)
		@user = User.find_by_username(username)
		return nil if @user.nil?
		@user.is_password?(password) ? @user : nil
	end

	def password=(plaintext)
		if plaintext.present?
			@password = plaintext
			self.password_digest = BCrypt::Password.create(plaintext)
		end
	end

	def is_password?(plaintext)
		BCrypt::Password.new(self.password_digest).is_password?(plaintext)
	end

	def reset_session_token!
		self.session_token = SecureRandom.hex
		self.save!
		self.session_token
	end

	def ensure_session_token
		self.session_token ||= SecureRandom.hex
	end
end
