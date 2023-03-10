class Api::V1::SubscriptionsController < ApplicationController
  def index
    if Customer.exists?(params[:customer_id])
      customer = Customer.find(params[:customer_id])
      render json: SubscriptionSerializer.new(customer.subscriptions)
    else
      render json: {"errors": "invalid customer id"}, status: 404
    end
  end
  def create
    subscription = Subscription.new(subscription_params)
    if !Customer.exists?(params[:customer_id])
      render json: {"errors": "invalid customer id"}, status: 404
    elsif !Tea.exists?(params[:tea_id])
      render json: {"errors": "invalid tea id"}, status: 404
    elsif subscription.save
      render json: SubscriptionSerializer.new(Subscription.last), status: 201
    else
      render json: {"errors": "missing params"}, status: 404
    end
  end
  def destroy
    if Subscription.exists?(params[:id])
      # Subscription.delete(params[:id])
      subscription = Subscription.find(params[:id])
      subscription.update!(cancelled: true)
      render json: {message: "The subscription was successfully cancelled"}
    else
      render json: {error: "No subscription with id #{params[:id]} exists"}, status: 404
    end
  end

private
  def subscription_params
    params.permit(:customer_id, :tea_id, :price, :frequency_monthly)
  end
end
