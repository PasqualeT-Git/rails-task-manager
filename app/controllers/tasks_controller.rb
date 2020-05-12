class TasksController < ApplicationController
  before_action :call_task, only: [:edit, :update, :show, :destroy]
  
  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end
  
  def create
    Task.create(secure_params)
    redirect_to tasks_path
  end

  def edit
  end
  
  def update
    @task.update(secure_params)
    redirect_to tasks_path
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end
  
  private

  def call_task
    @task = Task.find(params[:id])
  end
  

  def secure_params
    params.require(:task).permit(:title, :details)
  end
end
