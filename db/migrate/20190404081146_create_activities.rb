class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.references :room, foreign_key: true
      t.references :user, foreign_key: true
      t.integer    :action, limit: 4

      t.timestamps
    end
    add_index :activities, [:room_id, :created_at]
  end
end
