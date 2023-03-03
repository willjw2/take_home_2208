class Tea < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :brew_time, presence: true

  has_many :subscriptions
  has_many :customers, through: :subscriptions

end
