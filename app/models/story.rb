class Story < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  validates_presence_of :description
end
