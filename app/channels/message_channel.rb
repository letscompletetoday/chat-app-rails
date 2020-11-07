class MessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "message"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    ActionCable.server.broadcast "message",
                                   message: data["code"]
  end
end
