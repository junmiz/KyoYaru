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
  
  private
    def set_task
      @task = Task.find(params[:id])
    end
  
    def task_params
      params.require(:task).permit(:content)
    end
  
end
