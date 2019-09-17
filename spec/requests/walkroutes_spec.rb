require 'rails_helper'

RSpec.describe "Walkroutes", type: :request do
  describe "GET /walkroutes" do
    it "works! (now write some real specs)" do
      get walkroutes_path
      expect(response).to have_http_status(200)
    end
  end
end
