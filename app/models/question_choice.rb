class QuestionChoice < ActiveRecord::Base
  belongs_to :question,
    inverse_of: :question_choices
  has_one :answer,
    inverse_of: :question_choice
  validates_presence_of :option
end
