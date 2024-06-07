Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do  
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end

    get '/users/sign_out' => 'devise/sessions#destroy'     
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "home#index"
  get "/home",to:"home#index"

  # get "/articles",to:"articles#index"
  # get "/articles/:id",to:"articles#show"

  resources :articles do
    resources :comments
  end
end 

