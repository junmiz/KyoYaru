class TodayTasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:update]

  def index
    @tasks = current_user.tasks.where(selected: true)

  end
  
  def update
    @task.status = Task::STATUS_COMPLETE

    respond_to do |format|
      if @task.save
        format.html { redirect_back fallback_location: root_path, notice: 'Task was successfully complete.' }
      else
        format.html { render :index }
      end
    end
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end
end
