require "rails_helper"

RSpec.feature "Delete story" do

     before do
        @user = User.create!(email: "me@example.com" , password: "password" , nickname:"MyNick")
        @user2 = User.create!(email: "me2@example.com" , password: "password" , nickname:"MyNick")
        @project = Project.create!(name:"BN-GOAL" , description: "DEscription bngoal" , user: @user)
        
        #(0..1).each do |i|
            Story.create(description:" Description",project: @project ,user: @user2)
        #end
        
    end
    
    scenario "Select a story them delete" do
        visit root_path
        login_as @user
        click_link "Projects"
        click_link @project.name
        click_link "Stories"
        
       # @project.stories.each do |story|
            
            click_link "Delete"
            expect(page).to have_content("Story has been succesfully deleted.")
            
      #  end
        
    end
end