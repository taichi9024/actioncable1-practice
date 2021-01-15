class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    message = Message.create!(content: data["message"])
    ActionCable.server.broadcast(
      "room_channel", {message: render_mes(message)}
    )
  end

  private
  def render_mes(message)
    ApplicationController.render(
      partial: "messages/message",
      locals: {message: message}
    )
  end

  def set_room
    @room = Room.find_by(giver_id:current_user.id, getter_id: params[:id])
  end
end
