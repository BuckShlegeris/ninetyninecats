class User < ActiveRecord::Base
  attr_accessible :user_name, :password_digest, :password
  validates :user_name, :password_digest, :presence => true
  validates :user_name, :uniqueness => true

  has_many :cats
  has_many :sessions

  def self.find_by_credentials(user_name, password)
    user = User.find_by_user_name(user_name)

    if user && user.is_password?(password)
      user
    else
      nil
    end
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
end