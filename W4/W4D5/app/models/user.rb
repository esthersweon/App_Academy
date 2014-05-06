class User < ActiveRecord::Base
	attr_reader :password
	validates :email, :password_digest, :session_token, presence: true
	before_validation :ensure_session_token

	def self.generate_session_token
		session_token = SecureRandom.hex
	end

	def reset_session_token!
		self.session_token = SecureRandom.hex
		self.save!
		session_token
	end

	def password=(secret)
		@password = secret
		self.password_digest = BCrypt::Password.create(secret)
	end

	def is_password?(secret)
		BCrypt::Password.new(password_digest).is_password?(secret)
	end

	def self.find_by_credentials(email, secret)
		user = User.find_by_email(email)
		user.is_password?(secret) ? user : nil
	end

	def ensure_session_token
		self.session_token ||= SecureRandom.hex
	end
end
