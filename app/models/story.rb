class Story < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  validates_presence_of :description
  
  def list
    @stories = Story.where(project_id: self.project)
  end
end
