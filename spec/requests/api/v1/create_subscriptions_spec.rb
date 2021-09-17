require 'rails_helper'

RSpec.describe 'create subscription' do
  it 'returns happy json response' do
    fakey_mc_goober = Customer.create!(first_name: "Alex", last_name: "Ferencz", email: "email@mail.com", address: "home" )
    tea = Tea.create!(title: "black tea", description: "caffinated", temperature: 200, brew_time: 10)
    post "/api/v1/customer/#{fakey_mc_goober.id}/subscription", params:
    {
      title: "black tea",
      customer_id: "#{fakey_mc_goober.id}",
      price: 5,
      status: "active",
      frequency: 30
    }, as: :json
    subscription_result = JSON.parse(response.body, symbolize_names: true)
    expect(status).to eq(201)
  end

  it 'returns sad json response becuase no customer' do 
    tea = Tea.create!(title: "black tea", description: "caffinated", temperature: 200, brew_time: 10)

    post "/api/v1/customer/321/subscription", params:
    {
      title: "black tea",
      customer_id: 321,
      price: 5,
      status: "active",
      frequency: 30
    }, as: :json
    subscription_result = JSON.parse(response.body, symbolize_names: true)
    # raise subscription_result.inspect
    expect(status).to eq(404)
    expect(subscription_result[:error]).to eq("No customer with that id.")
  end

  it 'returns sad json response becuase no tea' do #explaination in name!!
    fakey_mc_goober = Customer.create!(first_name: "Alex", last_name: "Ferencz", email: "email@mail.com", address: "home" )
    post "/api/v1/customer/321/subscription", params:
    {
      title: "black tea",
      customer_id: 321,
      price: 5,
      status: "active",
      frequency: 30
    }, as: :json
    subscription_result = JSON.parse(response.body, symbolize_names: true)
    # raise subscription_result.inspect
    expect(status).to eq(404)
    expect(subscription_result[:error]).to eq("No tea with that name.")
  end
end
