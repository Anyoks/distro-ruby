class FurtherActionsController < ApplicationController
  before_action :set_further_action, only: [:show, :update, :destroy]

  # GET /further_actions
  def index
    @further_actions = FurtherAction.all

    render json: @further_actions
  end

  # GET /further_actions/1
  def show
    render json: @further_action
  end

  # POST /further_actions
  def create
    @further_action = FurtherAction.new(further_action_params)

    if @further_action.save
      render json: @further_action, status: :created, location: @further_action
    else
      render json: @further_action.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /further_actions/1
  def update
    if @further_action.update(further_action_params)
      render json: @further_action
    else
      render json: @further_action.errors, status: :unprocessable_entity
    end
  end

  # DELETE /further_actions/1
  def destroy
    @further_action.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_further_action
      @further_action = FurtherAction.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def further_action_params
      params.require(:further_action).permit(:name, :description)
    end
end
