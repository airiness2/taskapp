class LabelController < ApplicationController
  def new
    @label = Label.new
    #redirect_to tasks_path
  end

  def create
    @label = Label.new(label_params)
    @label.user_id = current_user.id
    if @label.save
      redirect_to tasks_path, notice: "ラベルを作成しました!"
    else
      render 'new'
    end
  end

  private

  def label_params
    params.require(:label).permit(:name, :user_id)
  end
end
