class StoriesController < ApplicationController
    
  before_action :set_project , except: :destroy
  
  def list
    @stories = Story.where(project_id: @project.id)
  end
  
  def create
    unless current_user
      flash[:danger] = "Please sign in or sign up first"
      redirect_to new_user_session_path
    else
      @story = @project.stories.build(story_params)
      @story.user = current_user

      if @story.save
        flash[:success] = "story has been created"
      else
        flash.now[:danger] = "story has not been created"
      end
      redirect_to project_path(@project)
    end
  end
  
    def destroy
      @project = Project.find(params[:project_id])
      @story = @project.stories.find(params[:id])
      if @story.destroy
        flash[:success] = "Story has been succesfully deleted."
        redirect_to list_stories_path(@project)
      else
        flash[:danger] = "Story has not been deleted"
        redirect_to projects_path(@project)
      end
    end
  

  private
  def story_params
    params.require(:story).permit(:description ,:project_id,:id )
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end
        