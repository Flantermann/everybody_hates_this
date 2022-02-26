class ChatroomsController < ApplicationController
  skip_after_action :verify_authorized
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end
