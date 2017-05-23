require 'rails_helper'

RSpec.describe "premium_subscriptions/show", type: :view do
  before(:each) do
    @premium_subscription = assign(:premium_subscription, PremiumSubscription.create!(
      :shirt_size => 2,
      :user_id => 3,
      :subscription_length => 4,
      :shipped => false,
      :shipping_address => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
