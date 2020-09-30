require "rails_helper"

RSpec.describe OthersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/others").to route_to("others#index")
    end

    it "routes to #show" do
      expect(:get => "/others/1").to route_to("others#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/others").to route_to("others#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/others/1").to route_to("others#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/others/1").to route_to("others#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/others/1").to route_to("others#destroy", :id => "1")
    end
  end
end
