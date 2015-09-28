Rails.application.routes.draw do
  namespace :v1 do
    resource :auth,
             only: [:create],
             controller: 'auth'
    resources :guests
  end
end
