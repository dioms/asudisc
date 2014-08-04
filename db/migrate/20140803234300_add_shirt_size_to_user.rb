class AddShirtSizeToUser < ActiveRecord::Migration
  def change
    add_column :users, :shirt_size, :string
  end
end
