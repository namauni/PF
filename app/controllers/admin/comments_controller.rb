class Admin::CommentsController < ApplicationController
def destroy
    Comment.find(params[:id]).destroy
    redirect_to content_path(comment.id)
end

def index
    @comments = Comment.all
end
end