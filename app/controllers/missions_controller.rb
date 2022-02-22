class MissionsController < ApplicationController
  before_action :set_mission, only: [:show, :edit, :update, :destroy]
  def index
    @missions = policy_scope(Mission)
  end

  def new
    @mission = Mission.new
    authorize @mission
  end

  def create
    @mission = Mission.new(mission_params)
    @mission.user = current_user
    authorize @mission
    if @mission.save
      redirect_to mission_path(@mission), notice: "YES!!! You have started a new mission."
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @mission.update(mission_params)
      redirect_to @mission, notice: "Your mission was successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @mission.destroy
    redirect_to root_path, notice: "Your mission was successfully deleted"
    # there should be some logic that your buddy gets a notice when you destroy your mission.
    # destroying a mission should also destroy the contract
  end

  private

  def mission_params
    params.require(:mission).permit(:category, :timeframe, :title, :description, :prefered_buddy_age_start, :prefered_buddy_age_end, :prefered_buddy_location )
  end

  def set_mission
    @mission = Mission.find(params[:id])
    authorize @mission
  end
end
