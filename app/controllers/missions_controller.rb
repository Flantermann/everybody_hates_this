class MissionsController < ApplicationController
  def new
    @mission = Mission.new
    authorize @mission
  end
end
