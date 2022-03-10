class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about, :blog ]

  def home
    general = Chatroom.find_by(name: "general")
    redirect_to chatroom_path(general) if general
  end

  def dashboard
    @user = current_user
    @my_missions = @user.missions
    @current_mission = @my_missions.last
    @accomplished_missions = @my_missions.where(finished?: true)
    @declined_contracts = Contract.all.where(status: "declined")
    if @current_mission
      if @current_mission.contract_id
        @current_contract = Contract.find_by(id: @current_mission.contract_id)
        @potential_buddy_mission = Mission.where(contract_id: @current_contract.id).where.not(user: @user).first
        @contract_asker = User.find_by(id: @current_contract.asker_id)
        @contract_receiver = User.find_by(id: @current_contract.receiver_id)
        if @current_contract.signed?
          @buddy_mission = Mission.where(contract_id: @current_contract.id).where.not(user: @user).first
        end
      end
    end
  end

  def about; end

  def blog; end
end
