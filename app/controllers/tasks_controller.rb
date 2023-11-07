class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: 'Task was successfully created.'
    else
      render :new
    end
  end
  
  private
    # Strong Parametersを使用して安全にパラメータをホワイトリストに登録
    def task_params
      params.require(:task).permit(:title, :content)
    end

end


