class MembersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_subscription_status

  def dashboard
  end

  private

  def check_subscription_status
    unless current_user.active_subscription
      redirect_to checkout_path(
        line_items: ["prod_QZ1DG5m2CKebMA"],
        payment_mode: "subscription",
      ), alert: "Sorry...You must have an active subscription to access this page."
    end
  end
end
