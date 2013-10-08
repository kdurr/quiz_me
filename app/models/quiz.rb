class Quiz < ActiveRecord::Base
  belongs_to :user,
    inverse_of: :quizzes
  has_many :submissions,
    inverse_of: :quiz
  has_many :questions,
    inverse_of: :quiz

  validates_presence_of :title
end
