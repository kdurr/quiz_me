class Submission < ActiveRecord::Base
  belongs_to :user,
    inverse_of: :submissions
  belongs_to :quiz,
    inverse_of: :submissions
  has_many :answers,
    inverse_of: :submission
  accepts_nested_attributes_for :answers
end
