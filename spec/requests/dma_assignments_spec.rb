require 'rails_helper'

RSpec.describe "DmaAssignments", type: :request do
  describe "GET /dma_assignments" do
    it "works! (now write some real specs)" do
      get dma_assignments_path
      expect(response).to have_http_status(200)
    end
  end
end
