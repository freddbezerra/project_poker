class StoriesController < ApplicationController
    
    before_action :set_project
    before_action :authenticate_user!
    
    def list
        if @project.class != NilClass
            @stories = Story.where(project_id: @project.id)
          
            if @stories.count == 0
              flash.now[:danger] = "No stories yet"
              redirect_to @project
            end
        else
            redirect_to new_project_path
        end  
      
    end
  
    def new
       
    end
    
    def create
        @story = @project.stories.build(story_params)
        @story.user = current_user
        if @story.save
            flash.now[:success] = "story was succesfull added to a project"
        else
            flash.now[:danger]  = "story was not added to a project"
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