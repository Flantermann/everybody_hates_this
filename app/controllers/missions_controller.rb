class MissionsController < ApplicationController
  before_action :set_mission, only: [:show, :edit, :update, :destroy, :finish]
  def index
    @missions = policy_scope(Mission.where.not(user_id: current_user.id).where(contract_id: nil))
    @missions = nil
    if params[:category].present? && params[:timeframe].present?
      @missions = Mission.where(category: params[:category], timeframe: params[:timeframe])
    elsif params[:timeframe].present?
      @missions = Mission.where(timeframe: params[:timeframe])
    elsif params[:category].present?
      @missions = Mission.where(category: params[:category])
    else
      @missions = Mission.all
    end
    respond_to do |format|
      format.html
      format.text { render partial: 'missions/mission', locals: { missions: @missions }, formats: [:html] }
    end
    #make the category form in the view
    #create filter functions for index in def index
    #index in JS: Step 4 in tutorial
    #pg_search gem in gemfile
    @missions = policy_scope(Mission.where.not(user_id: current_user.id).where(contract_id: nil))
  end

  def accomplished_missions
    @my_missions = current_user.missions
    @missions = policy_scope(@my_missions.where(finished?: true))
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
    @milestone = Milestone.new
    @declined_contracts = Contract.all.where(status: "declined")
    if @mission.contract_id
      @contract = Contract.find_by(id: @mission.contract_id)
      @contract_asker = User.find_by(id: @contract.asker_id)
      @contract_receiver = User.find_by(id: @contract.receiver_id)
    end
    @chatroom = @mission.chatroom
  end

  def finish
    @mission.update(finished?: true)
    @mission.save
    redirect_to mission_path(@mission), notice: "Congratulations! You have finished your mission!"
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
    # and the buddy should get a notice
  end

  private

  def mission_params
    params.require(:mission).permit(:category, :timeframe, :title, :description, :prefered_buddy_age_start, :prefered_buddy_age_end, :prefered_buddy_location, :contract_signed? )
  end

  def set_mission
    @mission = Mission.find(params[:id])
    authorize @mission
  end
end
