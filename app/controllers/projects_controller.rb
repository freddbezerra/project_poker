class ProjectsController < ApplicationController
  
  before_action :set_project, only:[:show,:edit,:update,:destroy]
  before_action :authenticate_user! ,except:[:index]

  def show
   @story = @project.stories.build
  end
  
  def new
    @project = Project.new
    
  end
  def index
    @projects = Project.all
  end
  
 
  
  def destroy
      if @project.destroy
        flash[:success] = "Project has been succesfully deleted."
        redirect_to projects_path
      else
        flash[:danger] = "Project has not been deleted"
        redirect_to projects_path
      end
  end
  
  def edit
  
  end
  
  def update
    if @project.update(project_params)
    flash[:success] = "Project has been succesfully updated."
      redirect_to project_path @project
    else
      flash.now[:danger] = "Project has not been  updated."
      render :edit
    end
    
  end
  
  def create
    @project = Project.new(project_params)
    @project.user = current_user
   
    if @project.save
      flash[:success] = "Project has been succesfully created."
      redirect_to project_path @project
    else
      flash[:danger] = "Project has not been created."
      redirect_to new_project_path
    end
  end
  
  private
    
    def set_project
       @project = Project.find(params[:id])
       @project.user = current_user
    end
    
    def project_params
      params.require(:project).permit(:name, :description)
    end
end
