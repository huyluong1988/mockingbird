class TasksController < ApplicationController
  def index
    @tasks = Task.all
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
  end

  def destroy
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :status, :user_id)
  end
end
