class QuestionsCommentsController < ApplicationController
before_action :is_matching_login_user, only: [:destroy]
def create
    comment = current_user.questions_comments.new(questions_comment_params)
    comment.save
    redirect_to top
end

def destroy
    Questions_comment.find(params[:id]).destroy
    redirect_to top
end

  private

  def questions_comment_params
    params.require(:comment).permit(:comment)
  end

end