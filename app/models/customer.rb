class Customer < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :teas, through: :subscriptions
  has_many :subscriptions

end
