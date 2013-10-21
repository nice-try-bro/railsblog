class User < ActiveRecord::Base
  has_many :posts, :foreign_key => :author_id

  has_secure_password :validations => false

  validates :name, :presence => true
  validates :email, :uniqueness => true, :presence => true, :email => true
  validates :login, :uniqueness => true, :presence => true
  validates :password_digest, :presence => true
end
