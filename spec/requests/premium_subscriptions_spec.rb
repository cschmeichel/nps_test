require 'rails_helper'

RSpec.describe "PremiumSubscriptions", type: :request do
  describe "GET /premium_subscriptions" do
    it "works! (now write some real specs)" do
      get premium_subscriptions_path
      expect(response).to have_http_status(200)
    end
  end
end
