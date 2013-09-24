class Question < ActiveRecord::Base
  belongs_to :quiz,
    inverse_of: :questions
  has_many :question_choices,
    inverse_of: :question
  has_many :answers,
    inverse_of: :question

  validates_presence_of :name
end
