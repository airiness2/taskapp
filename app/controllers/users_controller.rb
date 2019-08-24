class UsersController < ApplicationController

  def new
    if logged_in?
      redirect_to tasks_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    if current_user.id != @user.id
      redirect_to tasks_path, notice: "閲覧権限がありません"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                    :password_confirmation, :image, group_ids:[])
  end

end
