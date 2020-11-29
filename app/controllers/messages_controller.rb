class MessagesController < ApplicationController
  def index
    @room = Room.find(params[:room_id])
    if current_user.room_ids.index(@room.id) == nil
       redirect_to root_path
    
    else current_user.room_ids[current_user.room_ids.index(@room.id)] == @room.id
    @message = Message.new
    @messages = @room.messages.includes(:user)

    user = @room.room_users.pluck(:user_id)
    user.delete(current_user.id)
    @user = User.find(user[0])
    end
  end

  def create

    @room = Room.find(params[:room_id])
    user = @room.room_users.pluck(:user_id)
    user.delete(current_user.id)
    @user = User.find(user[0])
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room,anchor: 'u')
    else
      @message = @room.messages.includes(:user)
      redirect_to room_messages_path(@room,anchor: 'u')
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to root_path
  end
  
  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
end
