class User < ActiveRecord::Base
	before_validation :ensure_session_token

	validates :username, :password_digest, :session_token, presence: :true
	validates :username, :password_digest, :session_token, uniqueness: :true
	validates :password, length: {minimum: 6, allow_nil: true}
	
	has_many :posts

	attr_reader :password

	def self.find_by_creds(username, password)
		user = User.find_by_username(username)
		return nil if user.nil?
		user.is_password?(password) ? user : nil
	end

	def password=(password)
		if password.present?
			@password = password
			self.password_digest = BCrypt::Password.create(password)
		end
	end

	def is_password?(password)
		BCrypt::Password.new(self.password_digest).is_password?(password)
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
