Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/sleep_record_all", to: "sleep_records#index"
  post "/sleep_record", to: "sleep_records#create"

  put "/user/:user_id/:action_type/:friend_id", to: "user_followers#actions"
end
