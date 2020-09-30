require 'rails_helper'

RSpec.describe "Subdepartments", type: :request do
  describe "GET /subdepartments" do
    it "works! (now write some real specs)" do
      get subdepartments_path
      expect(response).to have_http_status(200)
    end
  end
end
