class GroupingsController < ApplicationController
  def create
    grouping = current_user.groupings.create(group_id: params[:group_id])
    redirect_to groups_path, notice: "#{grouping.group.name}に参加しました"
  end

  def destroy
    grouping = current_user.groupings.find_by(id: params[:id]).destroy
    redirect_to groups_path, notice: "#{grouping.group.name}から退会しました"
  end
end


# グループから退会ではなく、グループそのものを削除している
