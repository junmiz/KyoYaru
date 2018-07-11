class TodayTasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:update, :unselect]

  def index
    @tasks = current_user.tasks.where(selected: true).order(:order)

  end
  
  def update
    if params[:id] == 0
      @task.status = Task::STATUS_COMPLETE
    else
      @task.selected = false
    end

    if @task.save
    else
      render :index
    end
    
    tasks = current_user.tasks.where(selected: true).order(:order)
    tasks.each do |task|
      if task.status == Task::STATUS_INCOMPLETE
        # 未完了のタスクがあれば今からやるタスク画面にリダイレクト
        redirect_back fallback_location: root_path, notice: 'Task was successfully complete.' 
      end
    end
    
    # すべてのタスクが完了したら、すべて選択を外す
    tasks.each do |task|
      task.selected  = false
    end
    redirect_to tasks_select_url, notice: 'Task was all complete.'
      
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end
end
