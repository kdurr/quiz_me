class QuestionsController < ApplicationController

  def destroy

  end

  protected
  def questions_params
    params.require(:question).permit(:option, :correct, :quiz_id)
  end
end
