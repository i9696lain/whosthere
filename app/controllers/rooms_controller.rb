class RoomsController < ApplicationController
  def new
    @room = Room.new
  end

  def show
    @room = Room.find(params[:id])
    @users = @room.users
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to @room
    else
      render 'new'
    end
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update_attributes(room_params)
      redirect_to @room
    else
      render 'edit'
    end
  end

  private

    def room_params
      params.require(:room).permit(:name, :password, :password_confirmation)
    end

end
