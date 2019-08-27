class LabelController < ApplicationController
  def new
    @label = Label.new
  end

  def index
    @labels = Label.where(user_id: current_user.id)
    @labelings = Labeling.joins(:label).where(labels: {user_id: nil}).group(:name).count
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
