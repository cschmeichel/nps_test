require 'rails_helper'

RSpec.describe "premium_subscriptions/index", type: :view do
  before(:each) do
    assign(:premium_subscriptions, [
      PremiumSubscription.create!(
        :shirt_size => 2,
        :user_id => 3,
        :subscription_length => 4,
        :shipped => false,
        :shipping_address => ""
      ),
      PremiumSubscription.create!(
        :shirt_size => 2,
        :user_id => 3,
        :subscription_length => 4,
        :shipped => false,
        :shipping_address => ""
      )
    ])
  end

  it "renders a list of premium_subscriptions" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
