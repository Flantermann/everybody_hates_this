class ContractsController < ApplicationController
  def new
    @contract = Contract.new
  end

  def create
    # this is the mission of the current_user:
    @mission = current_user.missions.last
    # this creates a new contract:
    @contract = Contract.new
    # this gives the mission of current_user the contract_id of the newly created contract:
    @buddy_mission = Mission.find_by(id: params[:mission].to_i)
    # update contract_signed? in mission:
    # @mission.contract_signed? = true
    # add buddy_mission via params that come from the view when button is clicked
    # @mission_2 = ???
    # wouldn't that be the update action for contract? for create only one contract id is neccessary
    if @contract.save
      puts @contract.id
      @mission.contract_id = @contract.id
      @buddy_mission.contract_id = @contract.id
      @mission.save
      @buddy_mission.save
      redirect_to mission_path(@buddy_mission), notice: "Contract request was sent"
    else
      redirect_to mission_path(@buddy_mission), notice: "Oops! Something went wrong!"
    end
  end

  def accept
    set_contract
    @contract.missions.map { |mission| mission.update(contract_signed?: true) }
    @contract.signed!
    @mission = Mission.find_by(id: params[:mission].to_i)
    redirect_to mission_path(@mission), notice: "You have both signed the contract!"
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
