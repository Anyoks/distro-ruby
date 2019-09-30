# frozen_string_literal: true

class AssignmentsController < ApplicationController
  before_action :set_assignment, only: %i[show update destroy]

  # GET /assignments
  def index
    @assignments = Assignment.all

    render json: @assignments
  end

  # GET /assignments/1
  def show
    render json: @assignment
  end

  # POST /assignments
  def create
    # byebug  
    created_assignments = []
    assignment_errors = []

    
    # byebug


    params[:account_ids].each do |acc|
      # create assignment

      @assignment = Assignment.new(task_id: params[:task_id], staff_id: params[:staff_id], account_id: acc)

      if @assignment.save
        created_assignments << @assignment.id
        # return
      else
        assignment_errors << @assignment.errors
      end
    end

    if params[:account_ids].count == created_assignments.length
      # byebug
      render json: created_assignments, status: :created #, location: @assignment
    else
      # byebug
      render json: @assignment.errors, status: :unprocessable_entity
    end

   
  end

  # PATCH/PUT /assignments/1
  def update
    if @assignment.update(assignment_params)
      render json: @assignment
    else
      render json: @assignment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /assignments/1
  def destroy
    @assignment.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_assignment
    @assignment = Assignment.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def assignment_params
    params.require(:assignment).permit(:task_id, :staff_id, account_ids: [])
  end
end
#  id         :uuid             not null, primary key
#  task_id    :uuid             not null
#  staff_id   :uuid             not null
#  stage_id   :uuid             not null
#  account_id :uuid             not null
