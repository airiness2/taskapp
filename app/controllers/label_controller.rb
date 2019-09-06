class LabelController < ApplicationController
  before_action :set_label, only: [:edit, :update, :destroy]

  def new
    @label = Label.new
  end

  def index
    @labels = Label.where(user_id: current_user.id)
    @labelings = Labeling.joins(:label).where(labels: { user_id: nil }).group(:name).count
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

  def edit; end

  def update
    if @label.update(label_params)
      redirect_to label_index_path, notice: "ラベルを編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @label.destroy
    redirect_to label_index_path, notice: "ラベルを削除しました！"
  end

  private

  def label_params
    params.require(:label).permit(:name, :user_id)
  end

  def set_label
    @label = Label.find(params[:id])
  end
end
