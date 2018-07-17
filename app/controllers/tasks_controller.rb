class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:destroy]
  
  def index
    @tasks = current_user.tasks.where(selected: false).where(status: Task::STATUS_INCOMPLETE)
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    # ★あとでmigrateファイルにデフォルト値の設定を追加
    @task.user_id = current_user.id
    @task.selected = false
    @task.status = Task::STATUS_INCOMPLETE

    if @task.save
      redirect_back fallback_location: root_path, notice: 'Task was successfully created.'
    else
      render :index
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.' 
  end
  
  def select_index
    @tasks = current_user.tasks.where(selected: false).where(status: Task::STATUS_INCOMPLETE)
    @task = Task.new
  end
  
  def select_update
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
  
  private
    def set_task
      @task = Task.find(params[:id])
    end
  
    def task_params
      params.require(:task).permit(:content)
    end
  
end
