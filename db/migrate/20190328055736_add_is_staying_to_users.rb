class AddIsStayingToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :is_staying, :boolean, default: false
  end

end
