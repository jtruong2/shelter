require 'rails_helper'

RSpec.describe HostShelters::PropertiesController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      Role.create(name: "user")
      user = User.new(first_name: "Bart",
                      last_name: "Starr",
                      email: "shelter@homies.com")
      allow_any_instance_of(ApplicationController).to receive(:current_user).
      and_return(user)


      get :new
      expect(response).to have_http_status(:success)
    end
  end

end
