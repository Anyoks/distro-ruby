require 'rails_helper'

RSpec.describe "FormQuestionOptions", type: :request do
  describe "GET /form_question_options" do
    it "works! (now write some real specs)" do
      get form_question_options_path
      expect(response).to have_http_status(200)
    end
  end
end
