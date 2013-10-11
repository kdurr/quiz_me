class Answer < ActiveRecord::Base
  belongs_to :question,
    inverse_of: :answers
  belongs_to :submission,
    inverse_of: :answers
  belongs_to :question_choice,
    inverse_of: :answer
end
