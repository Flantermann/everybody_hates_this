class ContractsController < ApplicationController
  def new
    @contract = Contract.new
  end

  def create
    @asker = current_user
    @asker_mission = current_user.missions.last
    @buddy_mission = Mission.find_by(id: params[:mission].to_i)
    @receiver = @buddy_mission.user

    # this creates a new contract:
    @contract = Contract.new
    @contract.asker_id = @asker.id
    @contract.receiver_id = @receiver.id

    # @buddy_mission = Mission.find_by(id: params[:mission].to_i)
    # update contract_signed? in mission:
    # @mission.contract_signed? = true
    if @contract.save
      # puts @contract.id

      @asker_mission.contract_id = @contract.id
      @buddy_mission.contract_id = @contract.id
      @asker_mission.save
      @buddy_mission.save
      redirect_to dashboard_path, notice: "Contract request was sent"
    else
      redirect_to mission_path(@buddy_mission), notice: "Oops! Something went wrong!"
    end
  end

  def accept
    set_contract
    @contract.asker.missions.last.update(contract_signed?: true)
    @contract.receiver.missions.last.update(contract_signed?: true)
    # @contract.missions.map { |mission| mission.update(contract_signed?: true) }
    @contract.signed!
    @mission = Mission.find_by(id: params[:mission].to_i)
    redirect_to contract_path, notice: "You have both signed the contract!"
  end

  def decline
    set_contract
    @contract.missions.map { |mission| mission.update(contract_signed?: false) }
    @contract.missions.map { |mission| mission.update(contract_id: nil) }
    @mission = Mission.find_by(id: params[:mission].to_i)
    redirect_to mission_path(@mission), notice: "You have declined signing the contract!"
  end

  def show
    set_contract
    @asker_mission = @contract.asker.missions.where(contract_id: @contract.id).first
    @receiver_mission = @contract.receiver.missions.where(contract_id: @contract.id).first
  end

  def destroy
  end

  private

  def set_contract
    @contract = Contract.find(params[:id])
  end

  def contract_params
    params.require(:contract).permit(:status)
  end
end
