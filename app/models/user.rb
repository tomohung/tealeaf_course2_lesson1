class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  
  has_secure_password

  validates :username, presence: true, uniqueness: true
  
  before_save :generate_slug

  def to_param
    self.slug
  end

  def generate_slug
    #strip the string
    ret = self.username.strip

    #blow away apostrophes
    ret.gsub! /['`]/,""

    # @ --> at, and & --> and
    ret.gsub! /\s*@\s*/, " at "
    ret.gsub! /\s*&\s*/, " and "

    #replace all non alphanumeric, underscore or periods with underscore
     ret.gsub! /\s*[^A-Za-z0-9\.\-]\s*/, '_'  

     #convert double underscores to single
     ret.gsub! /_+/,"_"

     #strip off leading/trailing underscore
     ret.gsub! /\A[_\.]+|[_\.]+\z/,""

     self.slug = ret
  end

end