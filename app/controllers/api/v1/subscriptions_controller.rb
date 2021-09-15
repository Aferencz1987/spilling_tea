class Api::V1::SubscriptionsController < ApplicationController
  def index
    params = JSON.parse(request.body.read, symbolize_names: true)
    customer = Customer.find(params[:id])
    if customer
      subscriptions = customer.subscriptions
      render json: SubscriptionSerializer.new(subscriptions)
    else
      render json: {error: "You messed up!"}
    end
  end

  def create
    params = JSON.parse(request.body.read, symbolize_names: true)
    tea = Tea.find_by(title: params[:title])
    if Customer.exists?(params[:customer_id])
      customer = Customer.find(params[:customer_id])
      subscription = customer.subscriptions.new(tea: tea, title: tea.title, price: params[:price], status: params[:status], frequency: params[:frequency])
      if subscription.save
        render json: SubscriptionSerializer.new(subscription)
      else
        render json: {error: "Subscription not saved!"}, status: 405
      end
    else
      render json: {error: "No customer with that id."}, status: 404
    end
  end

  def update
    params = JSON.parse(request.body.read, symbolize_names: true)
    if Subscription.exists?(params[:subscription_id])
      subscription = Subscription.find(params[:subscription_id])
      subscription.update(frequency: params[:freqency])
      render json: SubscriptionSerializer.new(subscription)
    else
      render json: {error: "Subscription not found"}, status: 404
    end
  end

  def delete
    params = JSON.parse(request.body.read, symbolize_names: true)
    if Subscription.exists?(params[:subscription_id])
      subscription = Subscription.find(params[:subscription_id])
      subscription.update(status: "inactive")
      render json: SubscriptionSerializer.new(subscription)
    else
      render json: {error: "Subscription not found"}, status: 404
    end
  end
end
