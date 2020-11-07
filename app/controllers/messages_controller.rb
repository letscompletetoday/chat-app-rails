# frozen_string_literal: true

class MessagesController < ApplicationController

  # POST /messages
  def create
    @message = Message.new(message_params)

    if @message.save
      ActionCable.server.broadcast "message",
                                   message: @message
      render json: @message, status: :created, location: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end
  private

  # Only allow a trusted parameter "white list" through.
  def message_params
    params.require(:message).permit(:sender_name, :message, :profile_image, :channel_id)
  end
end
