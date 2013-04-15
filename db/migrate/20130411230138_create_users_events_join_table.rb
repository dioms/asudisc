class CreateUsersEventsJoinTable < ActiveRecord::Migration
  def change
    create_table :events_users, :id => false do |t|
      t.integer :user_id
      t.integer :event_id
    end
    add_index :events_users, [:user_id, :event_id]
  end
end
