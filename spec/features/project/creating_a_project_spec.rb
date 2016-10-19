require "rails_helper"

RSpec.feature "Listing projects" do

    scenario "Creating a project" do
        visit "/"
        
         click_link "Projects"
        
        fill_in "Name" , with:"Nome do projeto"
        fill_in "Description" , with: "Descrição do projeto"
        
        click_button "Create a Project"
        
        expect(page).to have_content("Project has been succesfully created.")
    end
end