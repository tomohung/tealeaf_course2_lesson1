class Comment < ActiveRecord::Base
  belongs_to :creator, foreign_key: :user_id, class_name: "User"
  belongs_to :post
  has_many :votes, as: :voteable
  
  validates :body, presence: true, length: {minimum: 5}

  def like_votes
    self.votes
  end
end