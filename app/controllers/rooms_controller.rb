class RoomsController < ApplicationController

 def subscribed
    stream_from "rooms_#{params['room_id']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    current_user.messages.create!(body: data['message'], room_id: data['room_id'])
  end

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      flash[:success] = 'Room added!'
      redirect_to rooms_path
    else
      render 'new'
    end
  end

  def show
    @room = Room.includes(:messages).find_by(id: params[:id])
    @message = Message.new
  end

  private

  def room_params
    params.require(:room).permit(:title)
  end
end