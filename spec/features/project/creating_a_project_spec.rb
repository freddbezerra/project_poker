require "rails_helper"

RSpec.feature "Create project" do

    before do
        @fredd = User.create!(email:"me@example.com",password: "password",nickname:"Fredd")
    end
    scenario "Creating a project with valid data" do
        visit "/"
        
        login_as @fredd
        
        click_link "Projects"
        click_link "New Project"
        
        fill_in "Name" , with:"Nome do projeto"
        fill_in "Description" , with: "Descrição do projeto"
        
        click_button "Create Project"
        
        expect(page).to have_content("Project has been succesfully created.")
    end
    
    scenario "Creating a project with invalid data" do
        visit "/"
        
        login_as @fredd
        
        click_link "Projects"
        click_link "New Project"
        
        fill_in "Name" , with:""
        fill_in "Description" , with: "Descrição do projeto"
        
        click_button "Create Project"
        
        expect(page).to have_content("Project has not been created.")
    end
end