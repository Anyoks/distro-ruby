require 'rails_helper'

RSpec.describe "Dmas", type: :request do
  describe "GET /dmas" do
    it "works! (now write some real specs)" do
      get dmas_path
      expect(response).to have_http_status(200)
    end
  end
end
