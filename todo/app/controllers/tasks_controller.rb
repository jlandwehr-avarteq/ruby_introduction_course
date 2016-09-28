class TasksController < ApplicationController
  before_action :set_task, only: [ :edit, :update, :update_status, :destroy ]

  def index
    @tasks = Task.all
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

  def update_status
    if @task.complete?
      @task.uncomplete!
    else
      @task.complete!
    end
    redirect_to root_path, notice: 'Status successfully changed.'
  end

  def update
    if @task.update(task_params)
      redirect_to root_path
    else
      flash[:error] = 'Task could not be updated!'
    end
  end

  def destroy
    @task.destroy
    redirect_to root_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :status)
  end
end
