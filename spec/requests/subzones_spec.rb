require 'rails_helper'

RSpec.describe "Subzones", type: :request do
  describe "GET /subzones" do
    it "works! (now write some real specs)" do
      get subzones_path
      expect(response).to have_http_status(200)
    end
  end
end
