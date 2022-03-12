# class ChatroomsController < ApplicationController
#   skip_after_action :verify_authorized
#   def show
#     @chatroom = Chatroom.find(params[:id])
#     @message = Message.new
#     # @chatrooms = Chatroom.all
#   end
# end

class ChatroomsController < ApplicationController
  def show
    skip_authorization
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end
