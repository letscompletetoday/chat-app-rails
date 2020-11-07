class ChannelsController < ApplicationController
  before_action :set_channel, only: [:show, :update, :destroy]

  # GET /channels
  def index
    @channels = Channel.all

    render json: @channels
  end

  # GET /channels/1
  def show
    render json: {channel: @channel, messages: @channel.messages}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_channel
      @channel = Channel.includes(:messages).find(params[:id])
    end

end
