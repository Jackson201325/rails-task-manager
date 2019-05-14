class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create 
    @task = Task.new(set_params)
    @task.save
    redirect_to tasks_path
  end


  def show 
  end

  def edit 
  end

  def update
    @task.update(set_params)
    redirect_to tasks_path
  end

  def destroy 
    @task.destroy
    redirect_to tasks_path

  end

  private 
  def set_params
    params.require('task').permit(:title, :detail)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
