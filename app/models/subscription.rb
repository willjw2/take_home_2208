class Subscription < ApplicationRecord
  validates :price, presence: true
  validates :frequency_monthly, presence: true
  validates :tea_id, presence: true
  validates :customer_id, presence: true

  belongs_to :customer
  belongs_to :tea

end
