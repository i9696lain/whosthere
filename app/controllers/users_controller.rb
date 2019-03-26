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
      redirect_to room_users_path(@room)
    else
      render 'users/new'
    end
  end

  def edit
    @user = User.find(params[:user_id])
  end

  def update
    @user = User.find(params[:user_id])
    if @user.update_attributes(user_params)
      redirect_to room_users_path(@user.room_id)
    else
      render 'edit'
    end
  end

  def destroy
    user = User.find(params[:user_id])
    user.destroy
    redirect_to room_users_path(user.room_id)
  end

  private

    def set_room
      @room = Room.find(params[:room_id])
    end

    def user_params
      params.require(:user).permit(:name)
    end

end
