class Submission < ActiveRecord::Base
  # serialize :result
  
  belongs_to :user,
    inverse_of: :submissions
  belongs_to :quiz,
    inverse_of: :submissions
  has_many :answers,
    inverse_of: :submission
  accepts_nested_attributes_for :answers

  def self.save_results
    @result = params[:result]
  end
end
