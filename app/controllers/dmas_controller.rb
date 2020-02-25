class DmasController < ApplicationController
  before_action :set_dma, only: [:show, :update, :destroy]

  # GET /dmas
  def index
    @dmas = Dma.all

    render json: @dmas
  end

  # GET /dmas/1
  def show
    render json: @dma
  end

  # POST /dmas
  def create
    @dma = Dma.new(dma_params)

    if @dma.save
      render json: @dma, status: :created, location: @dma
    else
      render json: @dma.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dmas/1
  def update
    if @dma.update(dma_params)
      render json: @dma
    else
      render json: @dma.errors, status: :unprocessable_entity
    end
  end

  # DELETE /dmas/1
  def destroy
    @dma.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dma
      @dma = Dma.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dma_params
      params.require(:dma).permit(:name)
    end
end
