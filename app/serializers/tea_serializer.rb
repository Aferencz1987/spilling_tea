class TeaSerializer
  include FastJsonapi::ObjectSerializer
  set_type :tea
  set_id :id
  attributes :title, :description, :temperature, :brew_time
end
