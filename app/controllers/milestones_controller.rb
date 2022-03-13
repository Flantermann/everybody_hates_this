class MilestonesController < ApplicationController
  def index
    @milestones = Milestone.all.where(user: current_user)
  end

  def new
    @milestone = Milestone.new
  end

  def create
    @mission = Mission.find(params[:mission_id])
    @milestone = Milestone.new(milestone_params)
    @milestone.mission = @mission
    if @milestone.save
      redirect_to mission_path(@mission), notice: "Yes! You have added a milestone to your mission!"
    else
      redirect_to mission_path(@mission), notice: "Sorry, something went wrong"
    end
  end

  def edit
  end

  def update
    set_milestone
    if @milestone.in_progress?
      @milestone.done!
    elsif @milestone.done?
      @milestone.in_progress!
    end
    if @milestone.save
      redirect_to @milestone.mission
    else
      redirect_to @milestone.mission, notice: "Sorry, something went wrong"
    end
  end

  def destroy
    set_milestone
    @milestone.destroy
    redirect_to @milestone.mission
  end

  private

  def set_milestone
    @milestone = Milestone.find(params[:id])
  end

  def milestone_params
    params.require(:milestone).permit(:description, :status)
  end
end
