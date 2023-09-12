class Admin::ContentsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @contents = Content.all
  end
  
  def destroy
    @content = Content.find(params[:id]) 
    @content.destroy
    redirect_to admin_contents_path
  end
end