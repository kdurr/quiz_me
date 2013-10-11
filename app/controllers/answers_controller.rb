class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_to @answer.question_choice.question.quiz
    end
  end

  private
  def answer_params
    params.permit(:quiz_id, :question_id, :question_choice_id, :submission_id)
  end
end
