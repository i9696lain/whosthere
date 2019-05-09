class AddUrltokenToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :url_token, :string
    add_index  :users, :url_token, unique: true
  end
end
