# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  validates :username, :password_digest, :session_token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }
  before_validation :ensure_session_token
  attr_reader :password

  has_many :subs,
    foreign_key: :moderator_id

  has_many :posts,
    foreign_key: :author_id

  has_many :comments,
    class_name: :Comment,
    foreign_key: :author_id



  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)

    (user && user.is_password?(password)) ? user : nil
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def generate_session_token
    token = SecureRandom.urlsafe_base64(16)
    while User.find_by(session_token: token)
      token = SecureRandom.urlsafe_base64(16)
    end
    token
  end

  def ensure_session_token
    self.session_token ||= generate_session_token
  end

  def reset_session_token!
    self.session_token = generate_session_token
    self.save!
    self.session_token
  end
end
