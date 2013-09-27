class QuizzesController < ApplicationController
  before_action :authenticate_user!

  # verify owner method to match current user in before

  def new
    @quiz = Quiz.new
    @quiz.questions.build
  end

  def create
    @quiz = Quiz.new(quiz_params)
    @quiz.user = current_user
    if @quiz.save
      flash[:notice] = "Quiz created successfully"
      redirect_to quiz_path(@quiz)
    else
      render :new
    end
  end

  def show
    @quiz = Quiz.find(params[:id])
  end


  protected
  def quiz_params
    params.require(:quiz).permit(:title, :age_rating, :private)
  end
end