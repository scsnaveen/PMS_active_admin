class AvatarController < ApplicationController
  def index
  	  	@avatars = Avatar.where(project_id: params[:project_id])
  end

  def new
    @project = Project.find(params[:project_id])
  	@avatar = Avatar.new
  end

  def create
   @project = Project.find(params[:project_id])
    @avatar = @project.avatar.new(avatar_params)
    @avatar.save
    redirect_to project_path(@project)
  end
  # def show
  # 	    @project = Project.find(params[:project_id])
  #       @avatars = Avatar.where(project_id: params[:project_id])
  # end

  def destroy
  	  	@avatar = Avatar.find(params[:id])
     @avatar.destroy
  end
 
  private
    def avatar_params
        params.permit(:attachment,:project_id)
    end
end

