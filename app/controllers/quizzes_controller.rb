class QuizzesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @quiz = Quiz.all
    @q = Quiz.search(params[:q])
    @quizzes = @q.result(distinct: true)
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
      flash[:notice] = "Please fill in blank fields"
      redirect_to new_quiz_path
    end
  end

  def show
    @quiz = Quiz.find(params[:id])
    @submission = @quiz.submissions.build
    @submission.answers.build
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
        [:name, question_choices_attributes:[:option, :correct]],
        submissions_attributes: [:result])
  end
end
