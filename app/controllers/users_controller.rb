class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
     if @user == current_user
        render :edit
     else
     redirect_to user_path(current_user)
     end
  end
  
    private

  def user_params
    params.require(:user).permit(:name, :displey_name, :user_id)
  end
  
end
