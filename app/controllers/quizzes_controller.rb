class QuizzesController < ApplicationController
  before_action :authenticate_user!

  # verify owner method to match current user in before

  def new
    @quiz = Quiz.new
    2.times { @quiz.questions.build }
  end

  def create
    @quiz = Quiz.new(quiz_params)
    @quiz.user = current_user
    binding.pry
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

  def update
    @quiz = Quiz.find(params[:id])
    respond_to do |format|
      if @quiz.update(quiz_params)
        format.html { redirect_to @quiz, notice: 'Quiz Updated' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  protected
  def quiz_params
    params.require(:quiz).permit(:title, :age_rating, :private, :question, questions_attributes: [:id, :name])
  end
end