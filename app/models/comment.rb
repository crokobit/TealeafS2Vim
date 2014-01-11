class Comment < ActiveRecord::Base
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post
  
  has_many :votes, as: :voteable

  validates :description, presence: true

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
