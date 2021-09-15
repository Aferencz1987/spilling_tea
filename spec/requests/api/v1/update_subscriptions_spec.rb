require 'rails_helper'

RSpec.describe 'update subscription' do
  it 'returns happy json response' do
    fakey_mc_goober = Customer.create!(first_name: "Alex", last_name: "Ferencz", email: "email@mail.com", address: "home" )
    tea = Tea.create!(title: "black tea", description: "caffinated", temperature: 200, brew_time: 10)
    subscription = fakey_mc_goober.subscriptions.create!(tea: tea, title: "black tea", price: 5, status: "active", frequency: 30)
    patch "/api/v1/subscription/#{subscription.id}", params:
      {
        subscription: "#{subscription.id}",
        frequency: 40
      }
    update_result = JSON.parse(response.body, symbolize_names: true)
  end

  it 'returns sad json response' do

  end
end
