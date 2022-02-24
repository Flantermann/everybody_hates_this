class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @my_missions = current_user.missions
    @current_mission = @my_missions.find_by(finished?: false)
    @accomplished_missions = @my_missions.where(finished?: true)
  end
end
