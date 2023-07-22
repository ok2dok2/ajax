Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  resources :users, only: [:show, :index]
  resources :blogs do
    resources :comments
  end
  root "blogs#index"

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
