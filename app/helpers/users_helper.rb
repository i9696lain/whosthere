module UsersHelper

  # ユーザのAvatar画像のinputタグを返す
  def avatar_imgsubmittag(user, class_name: '')
    class_name += " avatar"
    id_name = "user_" + user.id.to_s
    src = user.avatar_data.nil? ? 'user_default.jpg' : user.avatar[:small].url
    image_submit_tag(src, alt: user.name, class: class_name, id: id_name,
                     width: "65px", height: "65px")
  end

  # ユーザのAvatar画像のimgタグを返す
  def avatar_imgtag(user, class_name: '')
    class_name += " avatar"
    src = user.avatar_data.nil? ? 'user_default.jpg' : user.avatar[:small].url
    image_tag(src, class: class_name, size: "50x50")
  end

end
