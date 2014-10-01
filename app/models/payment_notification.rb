class PaymentNotification < ActiveRecord::Base
  attr_accessible :params, :status, :transaction_id, :user_id
  belongs_to :cart
  serialize :params
  after_create :mark_user_as_has_paid

  private
  def mark_user_as_has_paid
    puts "RUNNING"
    if status == "Completed"
      u = User.find(user_id)
      u.update_attributes(:has_paid => true)
      u.save!
      puts "RAN"
    end
  end

end
