require 'rails_helper'

RSpec.describe 'delete subscription' do
  it 'returns happy json response and deactivates subscription' do
    fakey_mc_goober = Customer.create!(first_name: "Alex",
                                       last_name: "Ferencz",
                                       email: "email@mail.com",
                                       address: "home" )
    tea = Tea.create!(title: "black tea",
                     description: "caffinated",
                     temperature: 200,
                     brew_time: 10)
    subscription = fakey_mc_goober.subscriptions.create!(tea_id: tea.id,
                                                        title: "black tea",
                                                        price: 5,
                                                        status: "active",
                                                        frequency: 30)

    delete "/api/v1/subscription/#{subscription.id}", params:
      {
        subscription_id: "#{subscription.id}"
      }, as: :json
    update_result = JSON.parse(response.body, symbolize_names: true)
    expect(status).to eq(200)
    expect(Subscription.first.status).to eq('inactive')
  end

  it 'returns sad json response because subscription doesnt exist' do
    fakey_mc_goober = Customer.create!(first_name: "Alex",
                                       last_name: "Ferencz",
                                       email: "email@mail.com",
                                       address: "home" )
    tea = Tea.create!(title: "black tea",
                     description: "caffinated",
                     temperature: 200,
                     brew_time: 10)

    delete "/api/v1/subscription/45", params:
      {
        subscription_id: "45"
      }, as: :json
    update_result = JSON.parse(response.body, symbolize_names: true)
    expect(status).to eq(404)
  end
end
