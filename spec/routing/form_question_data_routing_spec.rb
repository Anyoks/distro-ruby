require "rails_helper"

RSpec.describe FormQuestionDataController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/form_question_data").to route_to("form_question_data#index")
    end

    it "routes to #show" do
      expect(:get => "/form_question_data/1").to route_to("form_question_data#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/form_question_data").to route_to("form_question_data#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/form_question_data/1").to route_to("form_question_data#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/form_question_data/1").to route_to("form_question_data#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/form_question_data/1").to route_to("form_question_data#destroy", :id => "1")
    end
  end
end
