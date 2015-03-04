class RenamePaymentNotificationsToPayments < ActiveRecord::Migration
  def up
    rename_table :payment_notifications, :payments
  end

  def down
  end
end
