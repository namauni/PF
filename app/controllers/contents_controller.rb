class ContentsController < ApplicationController
  
  def new
    @content = Content.new
  end

  def index
    @contents = Content.all
  end

  def show
     @content = Content.find(params[:id]) 
     @comment = Comment..new
  end

  def edit
    @content = Content.find(params[:id]) 
  end

  def update
    @content = Content.find(params[:id])
    content.update(content_params)
    redirect_to content_path(content.id)  
  end
  
  def create
    @content = Content.new(content_params)
    @content.user_id = current_user.id
    if@content.save
      flash[:notice] = "You have created content successfully."
      redirect_to content_path(@content.id)
    else
      @contents = Content.all
      @user = current_user
      render :index
    end
  end
  
  def destroy
    @content = Content.find(params[:id]) 
    @content.destroy
    redirect_to contents_path
  end
  
  private
  # ストロングパラメータ
  def content_params
    params.require(:content).permit(:title, :text)
  end
end
