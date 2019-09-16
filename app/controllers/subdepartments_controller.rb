class SubdepartmentsController < ApplicationController
  before_action :set_subdepartment, only: [:show, :update, :destroy]

  # GET /subdepartments
  def index
    @subdepartments = Subdepartment.all

    render json: @subdepartments
  end

  # GET /subdepartments/1
  def show
    render json: @subdepartment
  end

  # POST /subdepartments
  def create
    @subdepartment = Subdepartment.new(subdepartment_params)

    if @subdepartment.save
      render json: @subdepartment, status: :created, location: @subdepartment
    else
      render json: @subdepartment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /subdepartments/1
  def update
    if @subdepartment.update(subdepartment_params)
      render json: @subdepartment
    else
      render json: @subdepartment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /subdepartments/1
  def destroy
    @subdepartment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subdepartment
      @subdepartment = Subdepartment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def subdepartment_params
      params.require(:subdepartment).permit(:name, :description, :references)
    end
end
