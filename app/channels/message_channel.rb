class MessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "message_#{params[:id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    message = Message.create!(data['message'])
    ActionCable.server.broadcast "message_#{message.channel_id.to_s}",
                                   data["message"].as_json
  end

  def message_params
    params.require(:message).permit(:sender_name, :message, :profile_image, :channel_id)
  end
end
