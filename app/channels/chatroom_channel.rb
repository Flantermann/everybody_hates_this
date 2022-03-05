class ChatroomChannel < ApplicationCable::Channel
 def subscribed
    chatroom = Chatroom.find(params[:id])
    stream_for chatroom

    # subscribe_chatrooms = Chatroom.where(sender_one: current_user).or(Chatroom.where(sender_two: current_user))
    # stream_for subscribe_chatrooms
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
