class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :update, :destroy]

  # GET /reports
  def index
    @reports = Report.all

    render json: @reports
  end

  # GET /reports/1
  def show
    render json: @report
  end

  # POST /reports
  def create
    @report = Report.new(report_params)

    if @report.save
      params[:report][:picture_data].each do |file|
         @report.pictures.create!(:picture => file)
         #create a picture associated with the report that has just been created
     end
      render json: @report, status: :created, location: @report
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reports/1
  def update
    if @report.update(report_params)
      render json: @report
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reports/1
  def destroy
    @report.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def report_params
      params.require(:report).permit(:completed, :comments, :further_action_id, :assignment_id, :stage_id, :picture_data => [])
    end
end
