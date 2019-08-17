class GroupsController < ApplicationController

  before_action :set_group, only: [:show, :edit, :update, :destroy]

  before_action :edit_group, only: [:edit, :update, :destroy]

  def index
    @groups = Group.all
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
end
