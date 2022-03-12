# class MessagesController < ApplicationController
# skip_before_action :verify_authenticity_token
# skip_after_action :verify_authorized


#   def create
#     @chatroom = Chatroom.find(params[:chatroom_id])
#     @message = Message.new(message_params)
#     @message.chatroom = @chatroom
#     @message.user = current_user
#     if @message.save
#       ChatroomChannel.broadcast_to(
#         @chatroom,
#         render_to_string(partial: "message", locals: { message: @message }))
#         redirect_to chatroom_path(@chatroom, anchor: "message-#{@message.id}")
#     else
#       render "chatrooms/show"
#     end
#   end

#   private

#   def message_params
#     params.require(:message).permit(:content)
#   end
# end

class MessagesController < ApplicationController

  def create
    skip_authorization
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save

      # choose which partial to render depending on user or mentor.
      # if @chatroom.meeting.mentoree_id == @message.user_id
        ChatroomChannel.broadcast_to(
          @chatroom,
          render_to_string(partial: "message", locals: { message: @message })
        )
      else
        ChatroomChannel.broadcast_to(
          @chatroom,
          render_to_string(partial: "message-right", locals: { message: @message })
        )
      end

      # if JS is not turned on it will refresh page
      respond_to do |format|
        format.html { redirect_to chatroom_path(@chatroom, anchor: "message-#{@message.id}") }
        format.js
      end

    else
      render "chatrooms/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
