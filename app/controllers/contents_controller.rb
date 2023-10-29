class ContentsController < ApplicationController
  
  before_action :authenticate_user!
  
  def new
    @content = Content.new
  end

  def index
    @contents = Content.page(params[:page])
    @tag_list=Tag.all
  end
  
  def arrivalorder
    @contents = Content.page(params[:page]).order(created_at: :desc)
  end

  def show
     @content = Content.find(params[:id]) 
     @comment = Comment.new
     @content_tags = @content.tags
  end

  def edit
    @content = Content.find(params[:id]) 
  end

  def update
    @content = Content.find(params[:id])
    if@content.update(content_params)
      tag_list=params[:content][:tag].split(',')
      @content.save_tag(tag_list)
      redirect_to content_path(@content.id)
    else
      render "edit"
    end
  end
  
  def create
    @content = Content.new(content_params)
    @content.score = Language.get_data(content_params[:text])  #この行を
    @content.user_id = current_user.id
    tag_list=params[:content][:tag].split(',')
    if@content.save
      @content.save_tag(tag_list)
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
    params.require(:content).permit(:title, :text, :user_comment)
  end
end
