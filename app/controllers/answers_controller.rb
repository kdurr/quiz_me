class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)
  end

  private
  def answer_params
    params.permit(:quiz_id, :question_id, :question_choice_id, :submission_id)
  end
end
