class TodayTasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = current_user.tasks.where(selected: true)

  end
  
  def complete
    task.status = STATUS_COMPLETE
    task.save
  end
end
