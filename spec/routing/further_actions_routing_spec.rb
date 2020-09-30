require "rails_helper"

RSpec.describe FurtherActionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/further_actions").to route_to("further_actions#index")
    end

    it "routes to #show" do
      expect(:get => "/further_actions/1").to route_to("further_actions#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/further_actions").to route_to("further_actions#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/further_actions/1").to route_to("further_actions#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/further_actions/1").to route_to("further_actions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/further_actions/1").to route_to("further_actions#destroy", :id => "1")
    end
  end
end
