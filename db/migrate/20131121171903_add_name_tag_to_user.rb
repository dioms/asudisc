class AddNameTagToUser < ActiveRecord::Migration
  def change
    add_column :users, :name_tag, :boolean
  end
end
