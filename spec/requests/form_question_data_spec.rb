require 'rails_helper'

RSpec.describe "FormQuestionData", type: :request do
  describe "GET /form_question_data" do
    it "works! (now write some real specs)" do
      get form_question_data_path
      expect(response).to have_http_status(200)
    end
  end
end
