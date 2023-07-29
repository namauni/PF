class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def index
    @questions = Question.all
  end

  def arrivalorder
    @questions = Question.all.order(created_at: :desc)
  end
  
  def show
     @question = Question.find(params[:id]) 
     @comment = QuestionsComment.new
  end
  
  def edit
    @question = Question.find(params[:id]) 
  end
  def update
    @question = Question.find(params[:id])
    Question.update(question_params)
    redirect_to question_path(question.id)  
  end
  
  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    if@question.save
      flash[:notice] = "You have created Question successfully."
      redirect_to question_path(@question.id)
    else
      @questions = Question.all
      @user = current_user
      render :index
    end
  end
  
  def destroy
    @question = Question.find(params[:id]) 
    @question.destroy
    redirect_to questions_path
  end
  
  private
  # ストロングパラメータ
  def question_params
    params.require(:question).permit(:title, :text, :answered)
  end
end
