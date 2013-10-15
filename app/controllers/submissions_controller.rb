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
      # @quiz.questions.each do |c|
      #   c.question_choices.each do |o|
      #    if o.correct == @submission.result
      #    end
      #   end
      # end
      redirect_to quizzes_path,
        notice: "Quiz taken!"
    else
      redirect_to quiz_path(@quiz)  
    end
  end

  protected
  def submission_params
    params.require(:submission).permit(:result, :answers_attributes)
  end

end
