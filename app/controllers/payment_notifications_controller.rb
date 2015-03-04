class PaymentNotificationsController < ApplicationController
  protect_from_forgery :except => [:create]

  def create
    Payment.create!(:params => params, :user_id => params[:custom].to_i, :status => params[:payment_status], :transaction_id => params[:txn_id] )
    p params
    render :nothing => true
  end

end
