class Project < ActiveRecord::Base
  belongs_to :user
  has_many :stories ,dependent: :destroy
  
  validates_presence_of :name , :description
  accepts_nested_attributes_for :stories, allow_destroy: true
  
  
  def self.persisted
    where.not(id: nil)
  end
  
  default_scope {order(created_at: :desc)}
end
