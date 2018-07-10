class SelectTasksController < ApplicationController
  def index
    @tasks = current_user.tasks.where(selected: false).where(status: Task::STATUS_INCOMPLETE)
    @task = Task.new
  end
  
  def create
    order = 1
    params["checked"]["id"].each do |e|
      task = current_user.tasks.find(e)
      task.order = order
      order += 1
      task.selected = true
      task.save
    end
    
    redirect_to today_tasks_path
  end
end
