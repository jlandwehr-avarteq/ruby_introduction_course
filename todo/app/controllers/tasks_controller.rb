class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, except: %i(index create)

  # Generate a @task to be used in the form
  # Retrieves @tasks that is all the task from the database
  # depending of the params[:filter], @tasks can be filtered
  def index
    @task = Task.new

    if params[:filter] == 'complete'
      @tasks = Task.complete
    elsif params[:filter] == 'uncomplete'
       @tasks = Task.uncomplete
    else
       @tasks = Task.all
    end
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to root_path, notice: 'Task successfully created.'
    else
      #flash[:error] = 'Task could not be saved!'
      redirect_to root_path, notice: "Task could not be saved!"
    end
  end

  def show
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
      redirect_to root_path, notice: 'Task successfully updated.'
    else
      redirect_to root_path, notice: 'Task could not be updated!'
    end
  end

  def destroy
    @task.destroy

    redirect_to root_path, notice: 'Task successfully destroyed.'
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :status)
  end
end
