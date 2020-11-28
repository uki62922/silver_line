class RoomsController < ApplicationController

  def index
    
  end

  def new
    @room = Room.new
    @user =User.find(params[:user])

    current_rooms = RoomUser.where(user_id:current_user.id)
    current_room_id = current_rooms.pluck(:room_id)
    @room_user = RoomUser.where(room_id:current_room_id)
    @room_id = @room_user.where(user_id:@user.id)
    
    @other_user_room = @room_id.pluck(:room_id)[0]
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end
    
  private

  def room_params
    params.require(:room).permit(user_ids: [])
  end
  
end
