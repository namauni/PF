class Admin::CommentsController < ApplicationController
    before_action :authenticate_admin!
def destroy
    Comment.find(params[:id]).destroy
    redirect_to admin_comments_path
end

def index
    @comments = Comment.all
end
end