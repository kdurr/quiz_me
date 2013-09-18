class Question < ActiveRecord::Base
  belongs_to :quiz
  has_many :question_choices
  has_many :answers

  validates_presence_of :name
end
