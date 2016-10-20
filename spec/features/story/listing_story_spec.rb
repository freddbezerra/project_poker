require "rails_helper"
RSpec.feature "List story" do
    
    
    before do
        @user = User.create!(email: "me@example.com" , password: "password" , nickname:"MyNick")
        @user2 = User.create!(email: "me2@example.com" , password: "password" , nickname:"MyNick")
        @project = Project.create!(name:"BN-GOAL" , description: "DEscription bngoal" , user: @user)
        
        (0..5).each do |i|
            Story.create(description:"#{i} Description",project: @project ,user: @user2)
        end
        
    end
    
    scenario "listing project" do
        
        visit list_stories_path(@project.id)
        
        expect(page).to have_content(@project.name)
        
    end
end