class UsersController < ApplicationController
  def index
    @users = User.all
    @p = @users.ransack(params[:q])
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @user = User.find(current_user.id)
  end

  def search
    @p = User.ransack(params[:q])
     if params[:q][:name_eq] != ""
    @results = @p.result
     else
       return false
     end 
  end
  private

  def user_params
    params.require(:user).permit(:name, :email, :image)
  end
end
