class FormQuestionDataController < ApplicationController
  before_action :set_form_question_datum, only: [:show, :update, :destroy]

  # GET /form_question_data
  def index
    @form_question_data = FormQuestionDatum.all

    render json: @form_question_data
  end

  # GET /form_question_data/1
  def show
    render json: @form_question_datum
  end

  # POST /form_question_data
  def create
    @form_question_datum = FormQuestionDatum.new(form_question_datum_params)

    if @form_question_datum.save
      render json: @form_question_datum, status: :created, location: @form_question_datum
    else
      render json: @form_question_datum.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /form_question_data/1
  def update
    if @form_question_datum.update(form_question_datum_params)
      render json: @form_question_datum
    else
      render json: @form_question_datum.errors, status: :unprocessable_entity
    end
  end

  # DELETE /form_question_data/1
  def destroy
    @form_question_datum.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form_question_datum
      @form_question_datum = FormQuestionDatum.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def form_question_datum_params
      params.require(:form_question_datum).permit(:data, :form_question_id, :position)
    end
end
