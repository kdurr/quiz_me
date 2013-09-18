class QuestionChoice < ActiveRecord::Base
  belongs_to :question
  has_one :answer

  validates_presence_of :option
end
