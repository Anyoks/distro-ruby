require "rails_helper"

RSpec.describe SubdepartmentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/subdepartments").to route_to("subdepartments#index")
    end

    it "routes to #show" do
      expect(:get => "/subdepartments/1").to route_to("subdepartments#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/subdepartments").to route_to("subdepartments#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/subdepartments/1").to route_to("subdepartments#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/subdepartments/1").to route_to("subdepartments#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/subdepartments/1").to route_to("subdepartments#destroy", :id => "1")
    end
  end
end
