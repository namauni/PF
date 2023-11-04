class QuestionsCommentsController < ApplicationController
  
before_action :authenticate_user!
before_action :is_matching_login_user, only: [:destroy]
def create
    @comment = current_user.questions_comments.new(questions_comment_params)
    @comment.question_id = params[:question_id]
    @comment.save
    redirect_to question_path(@comment.question_id)
end

def destroy
    QuestionsComment.find(params[:id]).destroy
    redirect_to question_path(questions_comment.id)
end

def index
  @questions_comments = QuestionsComment.page(params[:page]).order(created_at: :desc)
end  

  private

  def questions_comment_params
    params.require(:questions_comment).permit(:comment)
  end

end