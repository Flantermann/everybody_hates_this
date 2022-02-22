class MissionsController < ApplicationController
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
    @mission = Mission.find(params[:id])
    authorize @mission
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def mission_params
    params.require(:mission).permit(:category, :timeframe, :title, :description, :prefered_buddy_age_start, :prefered_buddy_age_end, :prefered_buddy_location )
  end
end
