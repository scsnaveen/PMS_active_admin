class TaskController < ApplicationController
  def create
	@project = Project.find(params[:project_id])
    @task = @project.tasks.create(task_params)
    redirect_to project_path

  end
  def index
  	@tasks = Task.where(project_id: params[:project_id])
  end
  def new
    puts  params[:project_id].inspect
  	@project = Project.find(params[:project_id])
  	@task = Task.new
  end
  def show
  	    @project = Project.find(params[:project_id])
  	    @project.user_id = current_user.id
        @tasks = Task.where(project_id: params[:project_id])
  end
  private
    def task_params
        params.permit(:name, :description)
    end
end
