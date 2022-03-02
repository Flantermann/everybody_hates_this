class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    general = Chatroom.find_by(name: "general")
    redirect_to chatroom_path(general) if general
  end

  def dashboard
    @user = current_user
    @my_missions = @user.missions
    @current_mission = @my_missions.last
    @accomplished_missions = @my_missions.where(finished?: true)
    if @current_mission.contract
      @current_contract = @current_mission.contract
      @potential_buddy_mission = Mission.where(contract_id: @current_contract.id).where.not(user: @user).first
      if @current_mission.contract.signed?
      @buddy_mission = Mission.where(contract_id: @current_contract.id).where.not(user: @user).first
      end
    end
  end
end
