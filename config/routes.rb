Rails.application.routes.draw do
  devise_for :users
  resources :splash

  resources :categories, only: [:index, :new, :create, :edit, :update, :destroy] do
    resources :expense_categories, only: [:index]
  end

  resources :expenses, only: [:new, :create, :destroy, :show]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "splash#index"
  devise_scope :user do 
    get '/users/sign_out' => 'devise/sessions#destroy' 
  end
end
