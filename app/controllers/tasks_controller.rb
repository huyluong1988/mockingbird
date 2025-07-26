class TasksController < ApplicationController
  def index
    if params[:user_id]
      @tasks = User.find(params[:user_id]).tasks
    else
      @tasks = Task.all
    end
    render json: @tasks
  end

  def show
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      render json: @task, status: :created
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    head :no_content
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :status, :user_id)
  end
end
