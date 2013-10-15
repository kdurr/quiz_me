class Question < ActiveRecord::Base
  belongs_to :quiz,
    inverse_of: :questions
  has_many :answers,
    inverse_of: :question
  has_many :question_choices,
    inverse_of: :question,
    :dependent => :destroy
  has_many :submissions,
    through: :answers
  accepts_nested_attributes_for :question_choices, 
    :reject_if => lambda { |a| a[:option].blank? },
    allow_destroy: true
  accepts_nested_attributes_for :answers,
    :reject_if => lambda { |a| a[:option].blank? },
    allow_destroy: true

  validates_presence_of :name
end
