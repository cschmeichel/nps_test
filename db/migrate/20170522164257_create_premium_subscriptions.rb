class CreatePremiumSubscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :premium_subscriptions do |t|
      t.belongs_to :user, index: true
      t.integer :shirt_size, default: 0
      t.integer :subscription_length, default: 0
      t.boolean :shipped, default: false
      t.json :shipping_address, null: false, default: {}

      t.timestamps
    end
  end
end
