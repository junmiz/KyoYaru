class TodayTodosController < ApplicationController
  before_action :authenticate_user!

  def index
    @todos = Todo.where(user_id: current_user.id)
    @todo = Todo.new
  end
end
