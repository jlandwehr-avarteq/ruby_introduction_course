class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show

  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to root_path
    else
      flash[:error] = 'Task could not be saved!'
    end
  end

  def edit

  end

  def update
    if @task.update
      redirect_to root_path
    else
      flash[:error] = 'Task could not be updated!'
    end
  end

  def destroy
    if @task.destroy
      redirect_to root_path
    else
      flash[:error] = 'Task could not be destroyed!'
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :status)
  end
end
