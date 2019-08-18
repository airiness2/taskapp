class GroupsController < ApplicationController

  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :edit_group, only: [:edit, :update, :destroy]
  before_action :sign_in_user
  before_action :user_in_group, only: [:show]

  def index
    @groups = Group.all
    @grouping = current_user.groupings.find_by(user_id: current_user.id)
  end

  def new
    if params[:back]
      @group = Group.new(group_params)
    else
      @group = Group.new
      @group.groupings.build
    end
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    @group.groupings.build(user_id: current_user.id, group_id: @group.id)
    if @group.save
      redirect_to groups_path, notice: "グループを作成しました!"
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to groups_path, notice: "グループを編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @group.destroy
    redirect_to groups_path, notice: "グループを削除しました！"
  end

  def confirm
    @group = Group.new(group_params)
    render :new if @group.invalid?
  end

  private

  def group_params
    params.require(:group).permit(:name, :info, :owner_id, user_ids:[])
  end

  def set_group
    @group = Group.find(params[:id])
  end

  def edit_group
    if @group.owner_id != current_user.id
      redirect_to groups_path, notice: 'グループの編集は作成者のみが行えます'
    end
  end

  def sign_in_user
    redirect_to new_session_path unless logged_in?
  end

  def user_in_group
    unless @group.group_users.ids.include?(current_user.id)
      redirect_to groups_path, notice: '詳細画面はグループメンバーのみ参照できます'
    end
  end

end
