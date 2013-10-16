class Answer < ActiveRecord::Base
  belongs_to :question,
    inverse_of: :answers
  belongs_to :submission,
    inverse_of: :answers
  belongs_to :question_choice,
    inverse_of: :answer

  validates_presence_of :question_choice
  validates_presence_of :question
end
