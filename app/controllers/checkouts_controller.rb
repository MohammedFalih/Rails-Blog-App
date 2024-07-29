class CheckoutsController < ApplicationController
  before_action :authenticate_user!

  def show
    current_user.set_payment_processor :stripe
    current_user.payment_processor.customer

    product_id = "prod_QYuYsqiGk6sNjd"
    price = Stripe::Price.list(product: product_id).data.first

    @checkout_session = current_user
      .payment_processor
      .checkout(
        mode: params[:payment_mode],
        line_items: params[:line_items],
        success_url: checkout_success_url,
      )
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @line_items = Stripe::Checkout::Session.list_line_items(params[:session_id])
  end
end
