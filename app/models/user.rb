class User < ApplicationRecord
  attr_accessor :password
  has_many :images
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "50x50#" }, default_url: "/images/:style/missing.png"


  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  validates_confirmation_of :password
  validates :email, :name, :presence => true, :uniqueness => true
  before_save :encrypt_password

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password,password_salt)
  end

  def self.authenticate(email, password)
    user = User.find_by "email = ?", email
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
end
