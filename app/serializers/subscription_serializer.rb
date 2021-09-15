class SubscriptionSerializer
  include FastJsonapi::ObjectSerializer
  set_type :subscription
  set_id :id
  attributes :title, :price, :status, :frequency, :customer_id, :tea_id
end
