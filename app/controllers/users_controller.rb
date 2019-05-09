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
    @user.url_token = SecureRandom.hex(10) 
    if @user.save
      @user.activities.create(room_id: @user.room.id, action: 3)
      redirect_to room_users_path(@room)
    else
      render 'users/new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to room_users_path(@user.room)
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to room_users_path(@user.room)
  end

  def enter
    @user.enter
    @user.activities.create(room_id: @user.room.id, action: 1)
    respond_to do |format|
      format.html { redirect_to room_path(@user.room) }
      format.js
    end
  end

  def leave
    @user.leave
    @user.activities.create(room_id: @user.room.id, action: 2)
    respond_to do |format|
      format.html { redirect_to room_path(@user.room) }
      format.js
    end
  end

  private

    def set_room
      @room = Room.find_by!(url_token: params[:room_url_token])
      redirect_to(room_login_url(@room)) unless current_room?(@room)
    end

    def set_user
      @user = User.find_by!(url_token: params[:user_url_token])
    end

    def user_params
      params.require(:user).permit(:name, :avatar)
    end

end
