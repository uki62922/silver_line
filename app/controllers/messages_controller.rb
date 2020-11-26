class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user)
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      @messages = @room.messages.includes(:user)
      render :index
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to root_path
  end
    
  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
end
