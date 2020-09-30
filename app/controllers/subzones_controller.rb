class SubzonesController < ApplicationController
  before_action :set_subzone, only: [:show, :update, :destroy]

  # GET /subzones
  def index
    @subzones = Subzone.all

    render json: @subzones
  end

  # GET /subzones/1
  def show
    render json: @subzone
  end

  # POST /subzones
  def create
    @subzone = Subzone.new(subzone_params)

    if @subzone.save
      render json: @subzone, status: :created, location: @subzone
    else
      render json: @subzone.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /subzones/1
  def update
    if @subzone.update(subzone_params)
      render json: @subzone
    else
      render json: @subzone.errors, status: :unprocessable_entity
    end
  end

  # DELETE /subzones/1
  def destroy
    @subzone.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subzone
      @subzone = Subzone.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def subzone_params
      params.require(:subzone).permit(:name, :description, :references)
    end
end
