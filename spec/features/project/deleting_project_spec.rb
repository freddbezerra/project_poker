require "rails_helper"

RSpec.feature "Delete project" do

    before do
        @fredd = User.create!(email:"me@example.com",password: "password",nickname:"Fredd")
        @project = Project.create!(name: "Project Name" ,description: "project Description" , user: @fredd)
    end
    scenario "Deleting a project with valid data" do
        visit "/"
        
        login_as @fredd
        
        click_link "Projects"
        click_link @project.name
        click_link "Delete"
        
        expect(page).to have_content("Project has been succesfully deleted.")
    end
    
   
end