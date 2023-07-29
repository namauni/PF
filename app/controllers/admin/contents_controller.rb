class Admin::ContentsController < ApplicationController
  def index
    @contents = Content.all
  end
  
  def destroy
    @content = Content.find(params[:id]) 
    @content.destroy
    redirect_to contents_path
  end
end