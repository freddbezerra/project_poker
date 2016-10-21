class ProjectsController < ApplicationController
  
   before_action :authenticate_user! ,except:[:index]
   before_action :set_project, only:[:show,:edit,:update,:destroy]

 
  def index
    @projects = Project.all
  end
  
  
  def new
    @project = Project.new
  end
  
  def create
    #@article = current_user.articles.build(article_params)
    @project =  current_user.projects.build(project_params)
   
    if @project.save
      flash[:success] = "Project has been succesfully created."
      redirect_to project_path @project
    else
      flash[:danger] = "Project has not been created."
      redirect_to new_project_path
    end
  end
  
   def show
    @story = @project.stories.build
   end
  
   def edit
    if @project.user != current_user
      flash[:danger] = "You can only edit your own Project."
      redirect_to root_path
    end
   end
   
    def update
    if @project.user != current_user
      flash[:danger] = "You can only edit your own article."
      redirect_to root_path
    else
      if @project.update(project_params)
        flash[:success] = "Project has been succesfully updated."
        redirect_to @project
      else
        flash.now[:danger] = "Project has not been updated"
        render :edit
      end
    end
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
  
 
  private
    def project_params
      params.require(:project).permit(:name, :description)
    end
    def set_project
       @project = Project.find(params[:id])
    end
    
    
end
