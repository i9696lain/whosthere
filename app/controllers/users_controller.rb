class UsersController < ApplicationController
  before_action :set_room, only: [:index,:create,:new,:edit,:update,:destroy,:enter,:leave]
  before_action :set_user, only: [:edit,:update,:destroy,:enter,:leave]

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
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to room_users_path(@user.room_id)
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to room_users_path(@user.room_id)
  end

  def enter
    @user.enter
    @user.activities.create(room_id: @user.room_id, action: 1)
    respond_to do |format|
      format.html { redirect_to room_path(@user.room_id) }
      format.js
    end
  end

  def leave
    @user.leave
    @user.activities.create(room_id: @user.room_id, action: 2)
    respond_to do |format|
      format.html { redirect_to room_path(@user.room_id) }
      format.js
    end
  end

  private

    def set_room
      @room = Room.find(params[:room_id])
      redirect_to(room_login_url(@room)) unless current_room?(@room)
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def user_params
      params.require(:user).permit(:name, :avatar)
    end

end
