require 'rails_helper'

RSpec.describe 'get all of a clients subscription' do
  it 'returns happy json response and returns subscriptions' do
    fakey_mc_goober = Customer.create!(first_name: "Alex",
                                       last_name: "Ferencz",
                                       email: "email@mail.com",
                                       address: "home" )
    tea = Tea.create!(title: "black tea",
                     description: "caffinated",
                     temperature: 200,
                     brew_time: 10)
    tea2 = Tea.create!(title: "green tea",
                    description: "caffinated",
                    temperature: 180,
                    brew_time: 2)
    subscription = fakey_mc_goober.subscriptions.create!(tea_id: tea.id,
                                                        title: "black tea",
                                                        price: 5,
                                                        status: "active",
                                                        frequency: 30)
    subscription2 = fakey_mc_goober.subscriptions.create!(tea_id: tea2.id,
                                                        title: "green tea",
                                                        price: 5,
                                                        status: "active",
                                                        frequency: 10)


    get "/api/v1/customer/#{fakey_mc_goober.id}/subscriptions", as: :json

    update_result = JSON.parse(response.body, symbolize_names: true)
    expect(status).to eq(200)
  end
end
