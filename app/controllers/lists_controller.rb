class ListsController < ApplicationController

  def index
    if params[:archived] && params[:archived] == "true"
      @lists = List.where(archived: true)
    else
      @lists = List.where(archived: false)
    end
  end

  def new

  end

  def create
    List.create(list_params)
    redirect_to root_path
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(title: params[:list][:title],
                description: params[:list][:description],
                archived: params[:list][:archived])
    redirect_to root_path
  end

  def destroy
    list = List.find(params[:id])
    list.tasks.delete_all
    List.delete(list)
    redirect_to root_path
  end

  private

  def list_params
    params.require(:lists).permit(:title, :description)
  end
end
