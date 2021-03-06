Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get '/customer/:id/subscriptions', to: 'subscriptions#index'
      post '/customer/:id/subscription', to: 'subscriptions#create'
      patch '/subscription/:id', to: 'subscriptions#update'
      delete '/subscription/:id', to: 'subscriptions#delete'
    end
  end
end
