class ChatroomsController < ApplicationController
  skip_after_action :verify_authorized

  def index
    @rooms = policy_scope(Chatroom)
    @current_user = current_user
    redirect_to '/signin' unless @current_user
    @rooms = Chatroom.public_rooms
    # @users = User.all_except(@current_user)
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    # @chatrooms = Chatroom.all
  end

  # def new
  #   @chatroom = Chatroom.new
  # end

  def create
    # raise
    @current_user = current_user
    @user = User.find_by(Mission.find_by(params[:id]).user_id)
    @chatroom = Chatroom.new(name: "chatroom-#{@current_user.id}:#{@user.id}", sender_one: @current_user, sender_two: @user)
    @chatroom.save!
    redirect_to @chatroom
  end
end
