class WalkroutesController < ApplicationController
  before_action :set_walkroute, only: [:show, :update, :destroy]

  # GET /walkroutes
  def index
    @walkroutes = Walkroute.all

    render json: @walkroutes
  end

  # GET /walkroutes/1
  def show
    render json: @walkroute
  end

  # POST /walkroutes
  def create
    @walkroute = Walkroute.new(walkroute_params)

    if @walkroute.save
      render json: @walkroute, status: :created, location: @walkroute
    else
      render json: @walkroute.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /walkroutes/1
  def update
    if @walkroute.update(walkroute_params)
      render json: @walkroute
    else
      render json: @walkroute.errors, status: :unprocessable_entity
    end
  end

  # DELETE /walkroutes/1
  def destroy
    @walkroute.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_walkroute
      @walkroute = Walkroute.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def walkroute_params
      params.require(:walkroute).permit(:name, :description, :references)
    end
end
