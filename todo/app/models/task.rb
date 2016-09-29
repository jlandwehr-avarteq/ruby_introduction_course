class Task < ActiveRecord::Base
  # Use for the Task status
  # /!\ Enum generate multiple functions:
  # * @task.complete! ==> changes the Task status to complete
  # * @task.complete? ==> verify if the Taks is complete and return true or false
  # * Task.complete == Task.where(status: Task.statuses[:complete]) ; and return the collection of
  #                                                                   @task
  enum status: [ :uncomplete, :complete ]
end
