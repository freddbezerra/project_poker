require "rails_helper"

RSpec.feature "Create story" do

    before do
        @user = User.create!(nickname: "Fredd" , email:"me@example.com" , password: "password")
        @project = Project.create!(name:"first-Project" , description:"simple description" , user: @user)
    end
    
    login_as @user
    
    scenario "Creating story with valid data" do
        visit root_path
        click_link "Projects"
        click_link @project.name
        
        fill_in 'Description' ,with: "The simple description of story"
        click_button "Save"
        
        expect(page).to have_content("story was succesfull added to a project")
    end

end