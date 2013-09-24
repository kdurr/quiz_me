class User < ActiveRecord::Base
  has_many :quizzes,
    inverse_of: :user
  has_many :submissions,
    inverse_of: :user

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :username
  validates_presence_of :password
  validates_presence_of :password_confirmation

  validates_format_of :email, 
    :with => /.+@.+\..+/i

  validates_numericality_of :age
end
