class TodosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_todo, only: [:destroy]
  
  def index
    @todos = Todo.all
    @todo = Todo.new
  end
  
  def create
    @todo = Todo.new(todo_params)
    @todo.user_id = current_user.id

    respond_to do |format|
      if @todo.save
        format.html { redirect_to todos_path, notice: 'Todo was successfully created.' }
        format.json { render :index, status: :created, location: @todo }
      else
        format.html { render :index }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @todo.destroy
    respond_to do |format|
      format.html { redirect_to todos_url, notice: 'Todo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
private
    def set_todo
      @todo = Todo.find(params[:id])
    end

  def todo_params
    params.require(:todo).permit(:content)
  end
  
end
