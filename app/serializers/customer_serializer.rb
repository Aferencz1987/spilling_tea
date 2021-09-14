class CustomerSerializer
  include FastJsonapi::ObjectSerializer
  set_type :customer
  set_id :id
  attributes :first_name, :last_name, :email, :address
end
