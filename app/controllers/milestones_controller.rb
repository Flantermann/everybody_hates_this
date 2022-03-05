class MilestonesController < ApplicationController
  def index
    @milestones = Milestone.all.where(user: current_user)
  end

  def new
    @milestone = Milestone.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_milestone
    @milestone = Milestone.find(params[:id])
  end

  def milestone_params
    params.require(:milestone).permit(:description)
  end
end
