class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :quizzes,
    inverse_of: :user
  has_many :submissions,
    inverse_of: :user

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :username

  validates_format_of :email, 
    :with => /.+@.+\..+/i

  validates_numericality_of :age

  def self.guest_record
    new { |u| u.guest = true }
  end
end
