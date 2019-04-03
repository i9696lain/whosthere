class RoomsController < ApplicationController
  before_action :set_room,     only: [:show,:edit,:update]

  def new
    @room = Room.new
  end

  def show
    @users = @room.users
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      log_in @room
      redirect_to @room
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @room.update_attributes(room_params)
      redirect_to @room
    else
      render 'edit'
    end
  end

  private

    def set_room
      @room = Room.find(params[:id])
      redirect_to(room_login_url(@room)) unless current_room?(@room)
    end

    def room_params
      params.require(:room).permit(:name, :password, :password_confirmation)
    end

end
