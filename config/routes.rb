Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'play', to: "games#play"
      get 'get_history', to: "games#get_history"
      post 'authenticate', to: 'authentication#create'
    end
  end
end
