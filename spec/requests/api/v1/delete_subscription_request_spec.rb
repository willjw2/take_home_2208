require 'rails_helper'

RSpec.describe 'Delete Customer Subscription' do
  it 'Can cancel a new customer subscription' do
    customer1 = Customer.create!(name: "Will Wang", email: "willy.j.wang@gmail.com")
    customer2 = Customer.create!(name: "Mondo Longwell", email: "mondo@gmail.com")
    tea1 = Tea.create!(title: "Green Tea", description: "Description", brew_time: 5)
    tea2 = Tea.create!(title: "Oolong Tea", description: "Description 2", brew_time: 7)
    tea3 = Tea.create!(title: "Lemon Tea", description: "Description 3", brew_time: 3)

    subscription1 = Subscription.create!(customer_id: customer1.id, tea_id: tea1.id, price: 5.99, frequency_monthly: 5)
    subscription2 = Subscription.create!(customer_id: customer1.id, tea_id: tea2.id, price: 3.40, frequency_monthly: 9)

    delete "/api/v1/customer/#{customer1.id}/subscriptions/#{subscription1.id}"

    expect(response).to be_successful
    # expect(customer1.subscriptions.size).to eq(1)
    expect(customer1.subscriptions.size).to eq(2)
    # expect(customer1.subscriptions[0].id).to eq(subscription2.id)
    expect(customer1.subscriptions[0].id).to eq(subscription1.id)
    expect(customer1.subscriptions[0].cancelled).to eq(true)
    expect(customer1.subscriptions[1].id).to eq(subscription2.id)
    expect(customer1.subscriptions[1].cancelled).to eq(false)

    message = JSON.parse(response.body,symbolize_names: true)[:message]
    expect(message).to eq("The subscription was successfully cancelled")
  end

  it 'Will return appropriate error message if subscription id does not exist' do
    customer1 = Customer.create!(name: "Will Wang", email: "willy.j.wang@gmail.com")
    customer2 = Customer.create!(name: "Mondo Longwell", email: "mondo@gmail.com")
    tea1 = Tea.create!(title: "Green Tea", description: "Description", brew_time: 5)
    tea2 = Tea.create!(title: "Oolong Tea", description: "Description 2", brew_time: 7)
    tea3 = Tea.create!(title: "Lemon Tea", description: "Description 3", brew_time: 3)

    subscription1 = Subscription.create!(customer_id: customer1.id, tea_id: tea1.id, price: 5.99, frequency_monthly: 5)
    subscription2 = Subscription.create!(customer_id: customer1.id, tea_id: tea2.id, price: 3.40, frequency_monthly: 9)

    delete "/api/v1/customer/#{customer1.id}/subscriptions/100000"
    expect(response).to_not be_successful
    expect(customer1.subscriptions.size).to eq(2)
    expect(customer1.subscriptions[0].cancelled).to eq(false)
    expect(customer1.subscriptions[1].cancelled).to eq(false)

    message = JSON.parse(response.body,symbolize_names: true)[:error]

    expect(message).to eq("No subscription with id 100000 exists")
  end
end
