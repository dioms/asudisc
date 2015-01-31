class CreateRsvps < ActiveRecord::Migration
  def change
    create_table :rsvps, :id => false do |t|
      t.integer :user_id
      t.integer :event_id
    end
    add_index :rsvps, [:user_id, :event_id]
  end
end
