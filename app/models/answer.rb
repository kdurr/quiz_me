class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :submission
  belongs_to :question_choice
end
