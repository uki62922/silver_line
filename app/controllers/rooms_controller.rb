class RoomsController < ApplicationController
  def index
  end

  def new
    @room = Room.new
    @user =User.find(params[:user])
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to  controller: :messages, action: :index
    else
      render :new
    end
  end
    
  private

  def room_params
    params.require(:room).permit(user_ids: [])
  end
  
end
