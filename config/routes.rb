Rails.application.routes.draw do
  devise_for :users
  root :to => "home#top"
  resources :drinks, only: [:index,:show,:edit,:create,:destroy,:update] do
    collection do
      post 'drink_save'
    end
  end
  resources :reviews, only: [:create,:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
