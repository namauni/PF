class CommentsController < ApplicationController
    
before_action :authenticate_user!
before_action :is_matching_login_user, only: [:destroy]
def create
    @comment = current_user.comments.new(comment_params)
    @comment.content_id = params[:content_id]
    @comment.save
    redirect_to content_path(@comment.content_id)
end

def destroy
    Comment.find(params[:id]).destroy
    redirect_to content_path(comment.id)
end

def index
    @comments = Comment.all.order(created_at: :desc)
end
  
  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
