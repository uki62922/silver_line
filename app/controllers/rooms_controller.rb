class RoomsController < ApplicationController
  def new
    @room = Room.new
  end

  private

  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end
  
end
