class HistorysController < ApplicationController
  def index
    @tasks = current_user.tasks.where(status: Task::STATUS_COMPLETE).order(:updated_at)
  end
end
