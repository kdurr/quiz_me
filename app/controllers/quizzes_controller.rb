class QuizzesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  # verify owner method to match current user in before
  def index
    @quiz = Quiz.all
    # @this_quiz = Quiz.find(params[:id])
  end

  def new
    @quiz = Quiz.new
    3.times do
      question = @quiz.questions.build
      2.times { question.question_choices.build }
    end
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
    @submission = Submission.new
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
    params.require(:quiz).permit(:title, :age_rating, :private,
      :question, questions_attributes:
        [:name, question_choices_attributes:[:option, :correct]])
  end
end
