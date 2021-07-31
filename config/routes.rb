Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root :to => "home#top"
  get "drinks/search",to: "drinks#search"
  resources :drinks, only: [:index,:show,:edit,:create,:destroy,:update,:search] do
    collection do
      post 'drink_save'
    end
    resources :reviews, only: [:create,:destroy,:index]
  end
  resources :users,only: [:show,:edit,:update]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
