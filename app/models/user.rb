class User < ApplicationRecord
  has_many :premium_subscriptions, dependent: :destroy

  validates :first_name, :last_name, presence: true, allow_blank: false
end
