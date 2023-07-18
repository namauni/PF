class CommentsController < ApplicationController
before_action :is_matching_login_user, only: [:destroy]
def create
    comment = current_user.comments.new(comment_params)
    comment.save
    redirect_to top
end

def destroy
    Comment.find(params[:id]).destroy
    redirect_to top
end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
