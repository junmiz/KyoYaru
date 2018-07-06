class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:destroy]
  
  def index
    @tasks = Task.where(user_id: current_user.id)
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id

    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_path, notice: 'Task was successfully created.' }
        #format.json { render :index, status: :created, location: @task }
      else
        format.html { render :index }
        #format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      #format.json { head :no_content }
    end
  end
  
  private
    def set_task
      @task = Task.find(params[:id])
    end
  
    def task_params
      params.require(:task).permit(:content)
    end
  
end
