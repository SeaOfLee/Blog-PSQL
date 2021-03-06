require 'bcrypt'
class User < ActiveRecord::Base
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :nickname, presence: true

  has_secure_password
  has_many :posts
  has_many :comments

  def to_s
    "This person's email is #{self.email}"
  end
  
end
