class UsersController < ApplicationController
  before_action :set_room , only: [:index,:create,:new]

  def index
    @users = @room.users
  end

  def new
    @user = @room.users.build()
  end

  def create
    @user = @room.users.build(user_params)
    if @user.save
      redirect_to @room
    else
      render 'users/new'
    end
  end

  def edit
  end


  def update
  end

  private

    def set_room
      @room = Room.find(params[:room_id])
    end

    def user_params
      params.require(:user).permit(:name)
    end

end
