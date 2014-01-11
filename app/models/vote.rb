class Vote < ActiveRecord::Base
  belongs_to :voteable, polymorphic: true
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  belongs_to :post
  belongs_to :comment
  validates_uniqueness_of :creator, scope: [:voteable_id, :voteable_type]
end
