class ZoneAssignmentsController < ApplicationController
  before_action :set_zone_assignment, only: [:show, :update, :destroy]

  # GET /zone_assignments
  def index
    @zone_assignments = ZoneAssignment.all

    render json: @zone_assignments
  end

  # GET /zone_assignments/1
  def show
    render json: @zone_assignment
  end

  # POST /zone_assignments
  def create
    @zone_assignment = ZoneAssignment.new(zone_assignment_params)

    if @zone_assignment.save
      render json: @zone_assignment, status: :created, location: @zone_assignment
    else
      render json: @zone_assignment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /zone_assignments/1
  def update
    if @zone_assignment.update(zone_assignment_params)
      render json: @zone_assignment
    else
      render json: @zone_assignment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /zone_assignments/1
  def destroy
    @zone_assignment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_zone_assignment
      @zone_assignment = ZoneAssignment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def zone_assignment_params
      params.require(:zone_assignment).permit(:zone_id, :task_id, :user_id, :staff_id, :stage_id)
    end
end
