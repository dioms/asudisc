class PaymentNotificationsController < ApplicationController
  protect_from_forgery :except => [:create]

  def create
    Payment.create(payment_params)
    render :nothing => true
  end

  private

    def payment_params
      {
        status:         params[:payment_status],
        transaction_id: params[:txn_id],
        user_id:        params[:custom].to_i,
        price:          params[:mc_gross].to_f,
        invoice:        params[:invoice],
        btn_id:         params[:btn_id]
      }
    end

end
