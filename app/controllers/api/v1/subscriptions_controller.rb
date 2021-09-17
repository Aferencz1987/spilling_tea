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
    if tea
      if Customer.exists?(params[:customer_id])
        customer = Customer.find(params[:customer_id])
        subscription = customer.subscriptions.new(tea: tea, title: tea.title, price: params[:price], status: params[:status], frequency: params[:frequency])
        if subscription.save
          result = {body: SubscriptionSerializer.new(subscription), status: 201}
        else
          result = {error: "Subscription not saved!", status: 405}
        end
      else
        result = {error: "No customer with that id.", status: 404}
      end
    else
      result = {error: "No tea with that name.", status: 404}
    end
    render json: result, status: result[:status]
  end

  def update
    params = JSON.parse(request.body.read, symbolize_names: true)
    if Subscription.exists?(params[:subscription_id])
      subscription = Subscription.find(params[:subscription_id])
      subscription.update(frequency: params[:frequency])
      result = {body: SubscriptionSerializer.new(subscription), status: 200}
    else
      result = {error: "Subscription not found", status: 404}
    end
    render json: result, status: result[:status]
  end

  def delete
    params = JSON.parse(request.body.read, symbolize_names: true)
    if Subscription.exists?(params[:subscription_id])
      subscription = Subscription.find(params[:subscription_id])
      subscription.update(status: "inactive")
      result = {body: SubscriptionSerializer.new(subscription), status: 200}
    else
      result = {error: "Subscription not found", status: 404}
    end
    render json: result, status: result[:status]
  end
end
