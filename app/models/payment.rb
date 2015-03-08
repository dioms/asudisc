class Payment < ActiveRecord::Base
  include Semesters
  attr_accessible :params, :status, :transaction_id, :user_id, :price, :invoice, :btn_id
  validates :status, inclusion: { in: %w(Completed) }
  belongs_to :user
  serialize :params

  def payment_end
    price == 50.0 ? created_at + 6.months : created_at
  end
end
