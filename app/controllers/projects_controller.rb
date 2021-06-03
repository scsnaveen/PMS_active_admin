class ProjectsController < ApplicationController
	before_action :authenticate_user!
  def index
    @projects = Project.all
  end
 def show
 	@project = Project.find(params[:id])
 end
   def new
    @project = Project.new()
  end
  def create
  	@project = Project.new(project_params)
    @project.user_id = current_user.id
    @project.project_type = params[:project_type]
      if @project.save
       redirect_to projects_path(:id=>@project.id)
      else
        render :new 
      end
  end
  def project_params
      params.permit(:title, :text,:project_type,:avatar,:attachment)
    end
end
