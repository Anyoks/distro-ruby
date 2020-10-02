require 'rails_helper'

RSpec.describe "FurtherActions", type: :request do
  describe "GET /further_actions" do
    it "works! (now write some real specs)" do
      get further_actions_path
      expect(response).to have_http_status(200)
    end
  end
end
