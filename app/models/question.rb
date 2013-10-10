class Question < ActiveRecord::Base
  belongs_to :quiz,
    inverse_of: :questions
  has_one :answer,
    inverse_of: :question
  has_many :question_choices,
    inverse_of: :question,
    :dependent => :destroy
  accepts_nested_attributes_for :question_choices, allow_destroy: true

  validates_presence_of :name
end
