require 'rails_helper'

RSpec.describe "premium_subscriptions/edit", type: :view do
  before(:each) do
    @premium_subscription = assign(:premium_subscription, PremiumSubscription.create!(
      :shirt_size => 1,
      :user_id => 1,
      :subscription_length => 1,
      :shipped => false,
      :shipping_address => ""
    ))
  end

  it "renders the edit premium_subscription form" do
    render

    assert_select "form[action=?][method=?]", premium_subscription_path(@premium_subscription), "post" do

      assert_select "input#premium_subscription_shirt_size[name=?]", "premium_subscription[shirt_size]"

      assert_select "input#premium_subscription_user_id[name=?]", "premium_subscription[user_id]"

      assert_select "input#premium_subscription_subscription_length[name=?]", "premium_subscription[subscription_length]"

      assert_select "input#premium_subscription_shipped[name=?]", "premium_subscription[shipped]"

      assert_select "input#premium_subscription_shipping_address[name=?]", "premium_subscription[shipping_address]"
    end
  end
end
