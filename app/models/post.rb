class Post < ActiveRecord::Base

  include Sluggable
  sluggable_column :title
  
  include Voteable

  has_many :comments
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :post_categories
  has_many :categories, through: :post_categories

  validates :description, presence: true

end


