json.extract! premium_subscription, :id, :shirt_size, :user_id, :subscription_length, :shipped, :shipping_address, :created_at, :updated_at
json.url premium_subscription_url(premium_subscription, format: :json)
