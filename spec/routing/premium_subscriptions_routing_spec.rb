require "rails_helper"

RSpec.describe PremiumSubscriptionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/premium_subscriptions").to route_to("premium_subscriptions#index")
    end

    it "routes to #new" do
      expect(:get => "/premium_subscriptions/new").to route_to("premium_subscriptions#new")
    end

    it "routes to #show" do
      expect(:get => "/premium_subscriptions/1").to route_to("premium_subscriptions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/premium_subscriptions/1/edit").to route_to("premium_subscriptions#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/premium_subscriptions").to route_to("premium_subscriptions#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/premium_subscriptions/1").to route_to("premium_subscriptions#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/premium_subscriptions/1").to route_to("premium_subscriptions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/premium_subscriptions/1").to route_to("premium_subscriptions#destroy", :id => "1")
    end

  end
end
