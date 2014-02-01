module Voteable

  extend ActiveSupport::Concern

  included do
    has_many :votes, as: :voteable
  end

  def total_votes_number
    up_votes_number - down_votes_number
  end

  def up_votes_number
    self.votes.where(vote: true).length
  end

  def down_votes_number
    self.votes.where(vote: false).length
  end

end
