class User < ActiveRecord::Base
  attr_accessible :email, :password
  attr_reader :password

  before_validation :ensure_session_token
  validates_presence_of :email, :password
  validates_uniqueness_of :email

  def self.generate_session_token
    SecureRandom.urlsafe_base64
  end

  def self.find_by_credentials(email, secret)
    user = User.find_by_email(email)
    if user.is_password?(secret)
      return user
    end
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
  end

  def password=(secret)
    @password = secret
    write_attribute(self.password_digest,
      BCrypt::Password.create(secret))
  end

  def is_password?(secret)
    BCrypt::Password.new(secret).is_password?(secret)
  end

  def ensure_session_token
    write_attribute(self.session_token,
      self.class.generate_session_token) if self.session_token.nil?
  end
end
