class SubmissionsController < ApplicationController
  before_action :authenticate_user!

  def new
    @submission = Submission.new
    @answers = @submission.answers.build
  end

  def create
    @quiz = Quiz.find(params[:quiz_id])
    @submission = @quiz.submissions.new(submission_params)
    @submission.user = current_user

    if @submission.save
      redirect_to submission_path(@submission),
        notice: "Quiz taken! You got a #{@submission.result}%!"
    else
      redirect_to quiz_path(@quiz)  
    end
  end

  def show
    @submission = Submission.find(params[:id])
    @quiz = @submission.quiz
  end

  protected
  def submission_params
    params.require(:submission).permit(:result, :answers_attributes => [:question_id, :question_choice_id])
  end

end
