class Submission < ActiveRecord::Base
  belongs_to :user,
    inverse_of: :submissions
  belongs_to :quiz,
    inverse_of: :submissions
  has_many :answers,
    inverse_of: :submission
  accepts_nested_attributes_for :answers

  before_save :user_score

  def user_score
    @answers = self.answers
    count = @answers.length
    initial_result = 0
    @answers.each do |a|
      if a.question_choice.correct == true
        initial_result += 1
      end
    end
    calculated_result = (initial_result.to_f/count.to_f)*100.0
    self.result = calculated_result.round(2)
  end
end
