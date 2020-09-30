require "rails_helper"

RSpec.describe DmasController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/dmas").to route_to("dmas#index")
    end

    it "routes to #show" do
      expect(:get => "/dmas/1").to route_to("dmas#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/dmas").to route_to("dmas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/dmas/1").to route_to("dmas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/dmas/1").to route_to("dmas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/dmas/1").to route_to("dmas#destroy", :id => "1")
    end
  end
end
