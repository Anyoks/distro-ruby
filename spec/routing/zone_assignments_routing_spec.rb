require "rails_helper"

RSpec.describe ZoneAssignmentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/zone_assignments").to route_to("zone_assignments#index")
    end

    it "routes to #show" do
      expect(:get => "/zone_assignments/1").to route_to("zone_assignments#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/zone_assignments").to route_to("zone_assignments#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/zone_assignments/1").to route_to("zone_assignments#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/zone_assignments/1").to route_to("zone_assignments#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/zone_assignments/1").to route_to("zone_assignments#destroy", :id => "1")
    end
  end
end
