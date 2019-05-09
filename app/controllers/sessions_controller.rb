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

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

    def set_room
      @room = Room.find_by(url_token: params[:room_url_token])
    end
end
