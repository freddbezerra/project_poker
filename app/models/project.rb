class Project < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name
  
  def self.persisted
    where.not(id: nil)
  end
  
  default_scope {order(created_at: :desc)}
end
