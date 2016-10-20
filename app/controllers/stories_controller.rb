class StoriesController < ApplicationController
    
    before_action :set_project
    
    def list
      @stories = Story.where(project_id: @project.id)
    end
  
    def new
       
    end
    
    def create
        @story = @project.stories.build(story_params)
        @story.user = current_user
        if @story.save
            flash[:success] = "story was succesfull added to a project"
        else
            flash[:danger]  = "story was not added to a project"
        end
        redirect_to project_path @project
    end
    
    private
        def story_params
            params.require(:story).permit(:description)
        end
        
        def set_project
            @project = Project.find(params[:project_id])
        end
end