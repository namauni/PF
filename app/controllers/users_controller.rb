class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]
  before_action :find_user, only: [:update]
  
  def show
    @user = User.find(params[:id])
  end

  def content_index
    @user = User.find(params[:id])
    @contents = @user.contents
  end
  
  def questions_index
    @user = User.find(params[:id])
    @questions = @user.questions
  end
  
  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user)
    end
  end
  
  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render :edit
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :displey_name, :user_id, :introduction)
  end
  
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.guest_user?
      redirect_to user_path(current_user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end  
  
  def find_user
    @user = User.find(params[:id])
  end
end
