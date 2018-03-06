Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: %i(create destroy index show update) do
    resources :artworks, only: %i(index)
  end
  resources :artworks, only: %i(create destroy show update)
  resources :artwork_shares, only: %i(create destroy)

end
