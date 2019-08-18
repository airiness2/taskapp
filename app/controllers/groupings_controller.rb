class GroupingsController < ApplicationController
  def create
    grouping = current_user.groupings.create(group_id: params[:group_id])
    redirect_to groups_path, notice: "#{grouping.group.name}に参加しました"
  end

  def destroy
    if current_user.user_groups.find_by(owner_id: current_user.id)
      redirect_to groups_path, notice: "グループの作成者はグループから離脱出来ません"
    else
      grouping = current_user.groupings.find_by(id: params[:id]).destroy
      redirect_to groups_path, notice: "#{grouping.group.name}から離脱しました"
    end
  end
end
