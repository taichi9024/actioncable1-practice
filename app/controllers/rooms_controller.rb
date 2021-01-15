class RoomsController < ApplicationController
  
  def new
    @room = Room.find_by(giver_id:current_user.id, getter_id: params[:user_id]) || Room.find_by(giver_id:params[:user_id], getter_id: current_user.id)  || nil
    if @room
      puts "[there is room]"
      redirect_to user_room_path(params[:user_id], @room.id)
    else
      @room = Room.create(giver_id:current_user.id, getter_id: params[:user_id])
      redirect_to user_room_path(params[:user_id], @room.id)
    end
  end
  
  def show
    @messages = Message.all
  end
end
