Rails.application.routes.draw do

  devise_for :users

  resources :places do
    resources :reviews, except: [:index, :show]
    collection do
      get 'search'
    end
  end

  root 'places#index'

  match '/about_us',   to: 'pages#about_us',   via: :get
  match '/contact_us', to: 'pages#contact_us', via: :get
  match '/hotels',     to: 'pages#hotels',     via: :get
  match '/restaurants',to: 'pages#restaurants',via: :get
  match '/cafes',      to: 'pages#cafes',      via: :get

end
