require 'spec_helper'
require 'rails_helper'

def params
  { "mc_gross"=>"30.00", "invoice"=>"2040", "protection_eligibility"=>"Ineligible", "payer_id"=>"C436Z2T6XT3LY", "tax"=>"0.00", "payment_date"=>"14:37:48 Mar 03, 2015 PST", "payment_status"=>"Completed",
              "charset"=>"windows-1252", "first_name"=>"Testing", "mc_fee"=>"1.17", "notify_version"=>"3.8", "custom"=>"1", "payer_status"=>"unverified", "business"=>"testuser@asu.edu", "quantity"=>"1", 
              "payer_email"=>"testing@gmail.com", "txn_id"=>"LKSDJFLSDF", "payment_type"=>"instant", "btn_id"=>"78007318", "last_name"=>"Grr", "receiver_email"=>"tester@asu.edu", "payment_fee"=>"1.17",
              "shipping_discount"=>"0.00", "insurance_amount"=>"0.00", "receiver_id"=>"DFKLSDKLF", "txn_type"=>"web_accept", "item_name"=>"DISC Fall 2014 Membership Dues 1 Semester", "discount"=>"0.00",
              "mc_currency"=>"USD", "item_number"=>"", "residence_country"=>"US", "handling_amount"=>"0.00", "shipping_method"=>"Default", "transaction_subject"=>"40",
              "payment_gross"=>"30.00", "shipping"=>"0.00", "ipn_track_id"=>"1as2304" }
end

def invalid_params
  params.deep_dup.tap { |p| p['payment_status'] = 'Failed' }
end

describe PaymentNotificationsController do
  before(:each) do
    user = FactoryGirl.create(:user)
  end
  
  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new payment in the database' do
        expect {
          #post :create, payment_notification: FactoryGirl.attributes_for(:payment)
          post :create, params
        }.to change(Payment,:count).by(1)
      end

    end

    context 'with invalid attributes' do
      it 'does not save the new payment in the database' do 
        expect {
          #post :create, payment_notification: FactoryGirl.attributes_for(:invalid_payment)
          post :create, invalid_params
        }.to_not change(Payment,:count)
      end

      it 'logs error'
    end
  end
end
