class Payment < ActiveRecord::Base
  include Semesters
  attr_accessible :params, :status, :transaction_id, :user_id, :price, :invoice, :btn_id
  validates :status, inclusion: { in: %w(Completed) }
  belongs_to :user
  serialize :params
  after_create :add_paid_semesters_to_user

  private
    def add_paid_semesters_to_user
        paid_semesters = [current_semester]
        paid_semesters << next_semester if price == 50
        u = User.find(user_id)
        u.update_attributes(paid: paid_semesters)
        u.save!
    end
end
