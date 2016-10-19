class ProjectsController < ApplicationController
  
  before_action :set_project, only:[:show,:edit,:update,:destroy]
  before_action :authenticate_user!, :except => [:show, :index,:new,:create]

  
  def new
    @project = Project.new
    #@project.user_id = current_user
  end
  def index
    @project = Project.all
  end
  
  def show
   
  end
  
  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:success] = "Project has been succesfully created."
      redirect_to project_path @project
    else
      flash[:danger] = "Project has not been created successfully"
      render :new
    end
  end
  
  private
    
    def set_project
       @project = Project.find(params[:id])
    end
    
    def project_params
      params.require(:project).permit(:name, :description)
    end
end
