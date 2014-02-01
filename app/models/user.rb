class User < ActiveRecord::Base
  include Sluggable
  sluggable_column :name
  
  has_many :posts  
  has_many :comments

  has_secure_password validations: false

  validates :name, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: {minimum: 5}
      
  def admin?
    self.role == 'admin'
  end

  def moderator?
    self.role == 'moderator'
  end
end
