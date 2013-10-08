class QuestionChoicesController < ApplicationController
  def new
    @question_choice = QuestionChoice.new
  end

  def create
    @question_choice = QuestionChoice.new(question_choice_params)
    if @question_choice.save
      redirect

  end

  protected
  def question_choice_params
    params.require(:question_choice).permit(:option, :correct)
  end

end