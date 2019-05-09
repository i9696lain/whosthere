class AddUrltokenToRooms < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :url_token, :string
    add_index  :rooms, :url_token, unique: true
  end
end
