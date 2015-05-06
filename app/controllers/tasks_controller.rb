class TasksController < ApplicationController
  def index
    @lists = List.where(archived: false)
  end

  def new
    @list = List.find(params[:list_id])
  end

  def create
    list = List.find(params[:list_id])
    task = Task.create(task_params)
    list.tasks << task
    redirect_to list_path(list)
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :due_date)
  end
end
