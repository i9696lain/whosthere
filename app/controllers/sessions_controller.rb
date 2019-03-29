class SessionsController < ApplicationController
  before_action :set_room

  def new
  end

  def create
    if @room && @room.authenticate(params[:session][:password])
      log_in @room
      redirect_to @room
    else
      render 'new'
    end
  end

  private

    def set_room
      @room = Room.find(params[:room_id])
    end
end
