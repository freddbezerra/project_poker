require "rails_helper"

RSpec.feature "Listing projects" do
    it "I can access the page link" do
        visit root_path
        expect(page).to have_link("Projects")
    end
end