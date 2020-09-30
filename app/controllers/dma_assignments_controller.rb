class DmaAssignmentsController < ApplicationController
  before_action :set_dma_assignment, only: [:show, :update, :destroy]

  # GET /dma_assignments
  def index
    @dma_assignments = DmaAssignment.all

    render json: @dma_assignments
  end

  # GET /dma_assignments/1
  def show
    render json: @dma_assignment
  end

  # POST /dma_assignments
  def create
    @dma_assignment = DmaAssignment.new(dma_assignment_params)

    if @dma_assignment.save
      render json: @dma_assignment, status: :created, location: @dma_assignment
    else
      render json: @dma_assignment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dma_assignments/1
  def update
    if @dma_assignment.update(dma_assignment_params)
      render json: @dma_assignment
    else
      render json: @dma_assignment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /dma_assignments/1
  def destroy
    @dma_assignment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dma_assignment
      @dma_assignment = DmaAssignment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dma_assignment_params
      params.require(:dma_assignment).permit(:dma_id, :task_id, :user_id, :staff_id, :stage_id, :desc)
    end
end
