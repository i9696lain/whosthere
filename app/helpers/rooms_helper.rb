module RoomsHelper

  # ルームの在室者数に応じたメッセージを返す
  def staying_user_count(room)
    if room.users.empty?
      t('rooms.show.staying_message', count: 0)
    elsif room.users.where(is_staying: false).count == 0 
      t('rooms.show.staying_message_max')
    else
      t('rooms.show.staying_message', count: room.users.where(is_staying: true).count )
    end
  end

end
