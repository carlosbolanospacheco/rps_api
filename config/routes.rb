Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'play' => "games#play"
      get 'get_history' => "games#get_history"
    end
  end
end
