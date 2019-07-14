class TasksController < ApplicationController

  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index

    if logged_in?
      @q = Task.ransack(params[:q])
      @tasks = @q.result.order(created_at: :desc)
      @tasks = @tasks.page(params[:page]).per(10)
    else
      redirect_to new_session_path
    end
  end

  def new
    if params[:back]
      @task = Task.new(task_params)
    else
      @task = Task.new
    end
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: "タスクを作成しました!"
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: "タスクを編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: "タスクを削除しました！"
  end

  def confirm
    @task = Task.new(task_params)
    render :new if @task.invalid?
  end

  private

  def task_params
    params.require(:task).permit(:name, :detail, :endtime, :status, :priority)
  end

  def set_task
    @task = Task.find(params[:id])
  end

end
