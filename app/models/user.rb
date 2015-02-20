require 'bcrypt'
class User < ActiveRecord::Base
  validates :email, presence: true
  validates :email, uniqueness: true

  has_secure_password
  has_many :posts
  has_many :comments
end
