class QuizzesController < ApplicationController
  before_action :authenticate_user!

  # verify owner method to match current user in before

  def new
    @quiz = Quiz.new
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
    4.times { @quiz.questions.build }
  end

  def update
    @quiz = Quiz.find(params[:id])
    respond_to do |format|
      if @quiz.update(quiz_params)
        format.html { redirect_to @quiz, notice: 'Quiz Updated'}
      else
        format.html { render action: 'edit' }
      end
    end
  end

  protected
  def quiz_params
    params.require(:quiz).permit(:title, :age_rating, :private, :question)
  end
end