class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    if current_user.id != @user.id
      redirect_to root_path, notice: "閲覧権限がありません"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                    :password_confirmation)
  end

  def ensure_correct_user
    @picture = Picture.find_by(id: params[:id])
    if current_user.id != @picture.user_id
      flash[:notice] = "権限がありません"
      redirect_to root_path
    end
  end

end
