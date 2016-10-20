require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do

before do
   @fredd = User.create!(email:"me@example.com",password: "password",nickname:"Fredd")
end
  
  describe "GET #create" do
  
   before :each do
    login_as(@fredd)
  end
   
    it "returns http success" do
       get :index
       expect(response).to have_http_status(:ok)
     end
  end

end
