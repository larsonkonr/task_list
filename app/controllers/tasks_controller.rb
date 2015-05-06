class TasksController < ApplicationController
  def index
    list = List.find(params[:list_id])
    redirect_to list_path(list)
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

  def edit
    @task = Task.find(params[:id])
  end

  def update
    Task.update(params[:id], task_params)
    redirect_to list_path(params[:list_id])
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :due_date)
  end
end
