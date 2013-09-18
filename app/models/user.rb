class User < ActiveRecord::Base
  has_many :quizzes
  has_many :submissions

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :username
  validates_presence_of :password

  validates_format_of :email, 
    :with => /.+@.+\..+/i
end
