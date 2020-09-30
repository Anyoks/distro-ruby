require "rails_helper"

RSpec.describe SubzonesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/subzones").to route_to("subzones#index")
    end

    it "routes to #show" do
      expect(:get => "/subzones/1").to route_to("subzones#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/subzones").to route_to("subzones#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/subzones/1").to route_to("subzones#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/subzones/1").to route_to("subzones#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/subzones/1").to route_to("subzones#destroy", :id => "1")
    end
  end
end
