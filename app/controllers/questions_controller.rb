class QuestionsController < ApplicationController
  
  before_action :authenticate_user!
  def new
    @question = Question.new
  end

  def index
    @questions = Question.page(params[:page])
    @tag_list=Tag.all
  end

  def arrivalorder
    @questions = Question.page(params[:page]).order(created_at: :desc)
  end
  
  def show
     @question = Question.find(params[:id]) 
     @comment = QuestionsComment.new
     @question_tags = @question.tags
  end
  
  def edit
    @question = Question.find(params[:id]) 
  end
  def update
    if@question = Question.find(params[:id])
      Question.update(question_params)
      tag_list=params[:question][:tag].split(',')
      @question.save_tag(tag_list)
      redirect_to question_path(@question.id)
    else
      render "edit"
    end
  end
  
  def create
    @question = Question.new(question_params)
    @question.score = Language.get_data(question_params[:text])  #この行を
    @question.user_id = current_user.id
    tag_list=params[:question][:tag].split(',')
    if@question.save
      @question.save_tag(tag_list)
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
