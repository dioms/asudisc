class AddOkNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :ok_name, :bool
  end
end
