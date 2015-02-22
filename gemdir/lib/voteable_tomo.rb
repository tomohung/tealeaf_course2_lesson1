module Voteable
  extend ActiveSupport::Concern
  included do
    has_many :votes, as: :voteable
  end

  def like_votes
    self.votes
  end
end