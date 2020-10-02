require "rails_helper"

RSpec.describe DmaAssignmentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/dma_assignments").to route_to("dma_assignments#index")
    end

    it "routes to #show" do
      expect(:get => "/dma_assignments/1").to route_to("dma_assignments#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/dma_assignments").to route_to("dma_assignments#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/dma_assignments/1").to route_to("dma_assignments#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/dma_assignments/1").to route_to("dma_assignments#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/dma_assignments/1").to route_to("dma_assignments#destroy", :id => "1")
    end
  end
end
