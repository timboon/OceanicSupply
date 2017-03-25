class ProjectsController < ApplicationController
  before_action :admins_only, only: [:destroy, :create, :new]
  layout "home_layout"
    
  def index
    @project = Project.all
  end
  
  
  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new(project_params)
    if @project.save
     flash[:success] = "Project Saved!"
      redirect_to projects_path
    else
     render action: :new
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find( params[:id])
  end
  
  def update

    @project = Project.find(params[:id])

    # mass assign edited profile attributes and save
    if @project.update_attributes(project_params)
      flash[:success] = "Project has been updated!"

      redirect_to projects_path(id: params[:id])
    else
      redirect_back(fallback_location: projects_path)
      flash[:error] = "Project update failed - please ensure all fields are filled"
    end
  end
  
  
  def destroy
    project=Project.find(params[:id])
    project.destroy
    flash[:success] = "Project deleted"
   redirect_back(fallback_location: users_path)
  end
  

  private
  
  def project_params
    params.require(:project).permit(:title, :avatar, :body)
  end
  
  
  def admins_only
    if !admin_signed_in?
     redirect_to(certs_path)
    end
  end
  
end
