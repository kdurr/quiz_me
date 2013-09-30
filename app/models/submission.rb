class Submission < ActiveRecord::Base
  belongs_to :user,
    through: :quiz,
    inverse_of: :submissions
  belongs_to :quiz,
    through: :user,
    inverse_of: :submissions
end
