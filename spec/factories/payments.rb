require 'faker'

FactoryGirl.define do
  factory :payment do |f|
    f.status 'Completed'
    f.transaction_id '5U1815080R455831Y'
    f.user_id 1
    f.price 30.0
    f.invoice '2040'
    f.btn_id '78007318'
  end

  factory :invalid_payment, parent: :payment do |f|
    f.status 'Failed'
  end

end
