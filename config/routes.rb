Rails.application.routes.draw do
  devise_for :guests
  namespace :v1 do
    resources :guests
  end
end
