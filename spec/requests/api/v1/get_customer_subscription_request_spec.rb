require 'rails_helper'

RSpec.describe 'Get Customer Subscriptions' do
  it 'Can get all customer subscriptions' do
    customer1 = Customer.create!(name: "Will Wang", email: "willy.j.wang@gmail.com")
    customer2 = Customer.create!(name: "Mondo Longwell", email: "mondo@gmail.com")

    tea1 = Tea.create!(title: "Green Tea", description: "Description", brew_time: 5)
    tea2 = Tea.create!(title: "Oolong Tea", description: "Description 2", brew_time: 7)
    tea3 = Tea.create!(title: "Lemon Tea", description: "Description 3", brew_time: 3)

    Subscription.create!(customer_id: customer1.id, tea_id: tea1.id, price: 5.99, frequency_monthly: 5)
    Subscription.create!(customer_id: customer1.id, tea_id: tea2.id, price: 2.50, frequency_monthly: 10)


    get "/api/v1/customer/#{customer1.id}/subscriptions"

    expect(response).to be_successful
    parsed_response = JSON.parse(response.body,symbolize_names: true)

    expect(parsed_response[:data].count).to eq(customer1.subscriptions.count)

    expect(parsed_response[:data][0][:attributes][:customer_id]).to eq(customer1.id)
    expect(parsed_response[:data][1][:attributes][:customer_id]).to eq(customer1.id)
    expect(parsed_response[:data][0][:attributes][:customer_id]).to_not eq(customer2.id)
    expect(parsed_response[:data][1][:attributes][:customer_id]).to_not eq(customer2.id)
  end
  # it 'Will return appropriate error message if email is not unique' do
  #   post "/api/v1/users", params: {"name": "Athena Dao", "email": "athenadao@bestgirlever.com"}, as: :json
  #   expect(response).to be_successful
  #
  #   post "/api/v1/users", params: {"name": "Athena Dao2", "email": "athenadao@bestgirlever.com"}, as: :json
  #   expect(response).to_not be_successful
  #
  #   parsed_response = JSON.parse(response.body,symbolize_names: true)
  #   expect(parsed_response).to eq({:errors=>"unique email address must be used"})
  #   # require "pry"; binding.pry
  # end
end
