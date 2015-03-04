class AddNewAttributesToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :price, :float
    add_column :payments, :invoice, :string
    add_column :payments, :btn_id, :string
  end
end
