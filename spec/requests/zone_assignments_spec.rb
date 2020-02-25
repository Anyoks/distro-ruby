require 'rails_helper'

RSpec.describe "ZoneAssignments", type: :request do
  describe "GET /zone_assignments" do
    it "works! (now write some real specs)" do
      get zone_assignments_path
      expect(response).to have_http_status(200)
    end
  end
end
