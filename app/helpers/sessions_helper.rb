module SessionsHelper

  def log_in(room)
    session[:room_id] = room.id
  end

  def current_room
    if session[:room_id]
      @current_room ||= Room.find(session[:room_id])
    end
  end

  def logged_in?
    !current_room.nil?
  end

end
