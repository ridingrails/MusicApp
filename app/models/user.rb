class User < ActiveRecord::Base
  attr_accessible :email, :password
  attr_reader :password

  before_validation :ensure_session_token, :only => [:create]
  validates_presence_of :email
  validates_uniqueness_of :email, :session_token
  validates :password,
            :length => { :minimum => 4, :allow_nil => true }

  def self.generate_session_token
    SecureRandom.urlsafe_base64
  end

  def self.find_by_credentials(email, secret)
    user = User.find_by_email(email)
    if user
      if user.is_password?(secret)
        return user
      end
    else
      nil
    end
  end

  def reset_session_token!
    write_attribute(:session_token,
                    self.class.generate_session_token)
    self.save!
  end

  def password=(secret)
    @password = secret
    write_attribute(:password_digest,
      BCrypt::Password.create(secret))
  end

  def is_password?(secret)
    BCrypt::Password.new(self.password_digest).is_password?(secret)
  end

  def ensure_session_token
    reset_session_token! if self.session_token.nil?
  end
end
