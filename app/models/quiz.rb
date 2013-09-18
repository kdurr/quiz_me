class Quiz < ActiveRecord::Base
  belongs_to :user
  has_many :submissions
  has_many :questions

  validates_presence_of :title
end
