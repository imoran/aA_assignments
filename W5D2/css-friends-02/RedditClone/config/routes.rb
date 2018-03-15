Rails.application.routes.draw do

  resources :posts, except: :index
  resources :subs, except: :destroy
  resources :users
  resource :session

  root 'sessions#new'

end
