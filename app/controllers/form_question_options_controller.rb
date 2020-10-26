class FormQuestionOptionsController < ApplicationController
  before_action :set_form_question_option, only: [:show, :update, :destroy]

  # GET /form_question_options
  def index
    @form_question_options = FormQuestionOption.all

    render json: @form_question_options
  end

  # GET /form_question_options/1
  def show
    render json: @form_question_option
  end

  # POST /form_question_options
  def create
    @form_question_option = FormQuestionOption.new(form_question_option_params)

    if @form_question_option.save
      render json: @form_question_option, status: :created, location: @form_question_option
    else
      render json: @form_question_option.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /form_question_options/1
  def update
    if @form_question_option.update(form_question_option_params)
      render json: @form_question_option
    else
      render json: @form_question_option.errors, status: :unprocessable_entity
    end
  end

  # DELETE /form_question_options/1
  def destroy
    @form_question_option.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form_question_option
      @form_question_option = FormQuestionOption.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def form_question_option_params
      params.require(:form_question_option).permit(:data, :form_question_id, :position)
    end
end
