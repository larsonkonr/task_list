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
    if task_params.include?("image") == false
      task = Task.find(params[:id])
      task.image.destroy
      Task.update(params[:id], task_params)
      redirect_to list_path(params[:list_id])
    else
      Task.update(params[:id], task_params)
      redirect_to list_path(params[:list_id])
    end
  end

  def toggle
    @task = Task.find(params[:id])

    if @task.update_attributes(:status => params[:status])
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :image)
  end
end
