require "rails_helper"

RSpec.feature "Update project" do

    before do
        @fredd = User.create!(email:"me@example.com",password: "password",nickname:"Fredd")
        @project = Project.create!(name: "Project Name" ,description: "project Description" , user: @fredd)
    end
    scenario "Updating a project with valid data" do
        visit "/"
        
        login_as @fredd
        
        click_link "Projects"
        click_link @project.name
        click_link "Edit Project"
        
        
        fill_in "Name" , with:"Nome do projeto"
        fill_in "Description" , with: "Descrição do projeto"
        
        click_button "Save Project"
        
        expect(page).to have_content("Project has been succesfully updated.")
    end
    
   
end