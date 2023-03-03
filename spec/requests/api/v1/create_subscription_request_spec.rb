require 'rails_helper'

RSpec.describe 'Create New Customer Subscription' do
  it 'Can create a new customer subscription using a json payload in the body of the request' do
    customer1 = Customer.create!(name: "Will Wang", email: "willy.j.wang@gmail.com")
    customer2 = Customer.create!(name: "Mondo Longwell", email: "mondo@gmail.com")
    tea1 = Tea.create!(title: "Green Tea", description: "Description", brew_time: 5)
    tea3 = Tea.create!(title: "Lemon Tea", description: "Description 3", brew_time: 3)

    post "/api/v1/customer/#{customer1.id}/subscriptions", params: {"tea_id": tea1.id, "price": 5.5, "frequency_monthly": 2}, as: :json

    expect(response).to be_successful
    parsed_response = JSON.parse(response.body,symbolize_names: true)
    data = parsed_response[:data]

    expect(data[:id]).to eq(Subscription.last.id.to_s)
    expect(data[:attributes][:customer_id]).to eq(customer1.id)
    expect(data[:attributes][:tea_id]).to eq(tea1.id)
    expect(data[:attributes][:price]).to eq(5.5)
    expect(data[:attributes][:frequency_monthly]).to eq(2)

    expect(Subscription.last.customer_id).to eq(customer1.id)
    expect(Subscription.last.tea_id).to eq(tea1.id)
    expect(Subscription.last.tea_id).to_not eq(tea3.id)
    expect(Subscription.last.price).to eq(5.5)
    expect(Subscription.last.frequency_monthly).to eq(2)
  end
  it 'Will return appropriate error message if customer id is not valid' do
    customer1 = Customer.create!(name: "Will Wang", email: "willy.j.wang@gmail.com")
    customer2 = Customer.create!(name: "Mondo Longwell", email: "mondo@gmail.com")
    tea1 = Tea.create!(title: "Green Tea", description: "Description", brew_time: 5)
    tea3 = Tea.create!(title: "Lemon Tea", description: "Description 3", brew_time: 3)

    post "/api/v1/customer/5000/subscriptions", params: {"tea_id": tea1.id, "price": 500.34, "frequency_monthly": 20}, as: :json

    expect(response).to_not be_successful
    expect(response.status).to eq(404)

    error_message = JSON.parse(response.body,symbolize_names: true)[:errors]
    expect(error_message).to eq("invalid customer id")
  end
  it 'Will return appropriate error message if tea id is not valid' do
    customer1 = Customer.create!(name: "Will Wang", email: "willy.j.wang@gmail.com")
    customer2 = Customer.create!(name: "Mondo Longwell", email: "mondo@gmail.com")
    tea1 = Tea.create!(title: "Green Tea", description: "Description", brew_time: 5)
    tea3 = Tea.create!(title: "Lemon Tea", description: "Description 3", brew_time: 3)

    post "/api/v1/customer/#{customer1.id}/subscriptions", params: {"tea_id": 5000, "price": 5.5, "frequency_monthly": 2}, as: :json

    expect(response).to_not be_successful
    expect(response.status).to eq(404)

    error_message = JSON.parse(response.body,symbolize_names: true)[:errors]
    expect(error_message).to eq("invalid tea id")
  end
  it 'Will return appropriate error message if params are missing' do
    customer1 = Customer.create!(name: "Will Wang", email: "willy.j.wang@gmail.com")
    customer2 = Customer.create!(name: "Mondo Longwell", email: "mondo@gmail.com")
    tea1 = Tea.create!(title: "Green Tea", description: "Description", brew_time: 5)
    tea3 = Tea.create!(title: "Lemon Tea", description: "Description 3", brew_time: 3)

    post "/api/v1/customer/#{customer1.id}/subscriptions", params: {"tea_id": tea1.id, "price": 5.5}, as: :json

    expect(response).to_not be_successful
    expect(response.status).to eq(404)
    error_message = JSON.parse(response.body,symbolize_names: true)[:errors]
    expect(error_message).to eq("missing params")
  end
end
