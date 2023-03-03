class CreateSubscription < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.float :price
      t.integer :frequency_monthly
      t.references :tea, foreign_key: true
      t.references :customer, foreign_key: true
    end
  end
end
