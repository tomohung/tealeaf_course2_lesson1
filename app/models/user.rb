class User < ActiveRecord::Base
  include Sluggable
  sluggable_column :username

  has_many :posts
  has_many :comments
  
  has_secure_password

  validates :username, presence: true, uniqueness: true
  
end