require "rails_helper"

RSpec.describe WalkroutesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/walkroutes").to route_to("walkroutes#index")
    end

    it "routes to #show" do
      expect(:get => "/walkroutes/1").to route_to("walkroutes#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/walkroutes").to route_to("walkroutes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/walkroutes/1").to route_to("walkroutes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/walkroutes/1").to route_to("walkroutes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/walkroutes/1").to route_to("walkroutes#destroy", :id => "1")
    end
  end
end
