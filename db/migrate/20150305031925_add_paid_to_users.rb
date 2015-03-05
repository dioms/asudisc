class AddPaidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :paid, :text
  end
end
